from django.shortcuts import render
from rest_framework.generics import RetrieveAPIView,CreateAPIView
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from rest_framework.status import HTTP_200_OK, HTTP_400_BAD_REQUEST,HTTP_201_CREATED
from rest_framework.views import APIView
from .models import UserOrganization
from api.individual.models import Userprofile
from .serializers import UserOrganizationRegistrationSerializer,OrganizationLoginSerializer, OrganizationSerializer
from bson import ObjectId

class OrganizationLoginView(APIView):
    permission_classes=[(AllowAny)]
    def get_object(self):
        print(self.request.data)
        return UserOrganization.objects.all()
    
    def post(self,request):
        success={"success":"True"}
        failure={"success":"False"}
        try :
            obj=UserOrganization.objects.get(email=str(request.data['email']))
            if obj.password==str(request.data['password']):
                return Response(success,status=HTTP_200_OK)
            else:
                return Response(failure,status=HTTP_400_BAD_REQUEST)
        except:
            return Response(failure,status=HTTP_400_BAD_REQUEST)

class OrganizationRegistrationView(APIView):
    permission_classes=[AllowAny]
    
    def post(self,request,*args,**kwargs):
        if 'email' not in request.data and 'password' not in request.data and 'name' not in request.data and 'name_org' not in request.data:
            return Response({"success":False},status=HTTP_400_BAD_REQUEST)
        print(str(request.data['email']))
        dic={}
        for i in request.data:
            dic.update({i:str(request.data[i])})
        user=UserOrganization.objects.create(**dic)
        response = {
            "success": "True",
            "status code": HTTP_200_OK,
            "message": "User registered  successfully",
        }

        return Response(response, status=HTTP_200_OK)

class ApproveLeaveView(APIView):
    permission_classes=[AllowAny]
    
    def post(self,request,*args,**kwargs):
        user=UserOrganization.objects.get(email=request.data['to_email'])
        individual=Userprofile.objects.get(email=request.data['from_email'])
        leaves=list(user.Leaves_to_be_approved)
        leave=leaves[int(request.data['index'])]['completed']
        leaves.pop(int(request.data['index']))
        user.Leaves_to_be_approved=leaves
        user.save()
        lis=list(individual.leave)
        print(request.data)
        print(lis)
        index=-1
        for i in lis:
            if i['from_date']==request.data['from_date'] and i['to_date']==request.data['to_date']:
                index=lis.index(i)
                break
        if index==-1:
            return Response({"success":"False"},HTTP_400_BAD_REQUEST)
        lis[index]['completed']="True"
        print(lis)
        individual.leave=lis
        individual.save()
        return Response({"success":"True"},HTTP_200_OK)
class AssignWorkView(APIView):
    permission_classes=[AllowAny]

    def post(self,request,*args,**kwargs):
        user=UserOrganization.objects.get(email=request.data['email'])
        print(user.employees)
        print(user.employees is None)
        if user.employees is None:
            lis=[]
            return Response('No employees',HTTP_400_BAD_REQUEST)
        else:
            lis=list(user.employees)

        for i in range(len(lis)):
            try:
                ind=Userprofile.objects.get(_id=ObjectId(lis[i]['_id']))
                print(ind)
                if ind.workassigned is None:
                    work=[]
                else:
                    work=list(ind.workassigned)
                print(True)
                dic={}
                for i in request.data:
                    dic[i]=request.data[i][0]
                print(dic)
                work.append(dic)
                ind.workassigned=work
                print('yes')
                ind.save()
                print('all')
            except:
                return Response({"success":"False"},HTTP_400_BAD_REQUEST)
        if user.work_assigned is None:
            assigned=[]
        else:
            assigned=list(user.work_assigned)
        
        assigned.append(request.data)
        print(assigned)
        user.work_assigned=assigned
        user.save()
        print(user.work_assigned)
        return Response({"success":"True"},HTTP_200_OK)
class AddEmployeeView(APIView):
    permission_classes=[AllowAny,]

    def post(self,request,*args,**kwargs):
        print(request.data)
        dic={}
        from_email=request.data['from_email']
        for i in request.data:
            if i!='from_email':
                dic[i]=request.data[i]
        dic['created_by']=from_email
        print(dic)
        try:
            ind=Userprofile.objects.create(**dic)
            user=UserOrganization.objects.get(email=from_email)
            lis=[]
            if user.employees is None:
                lis.append(ind._id)
            else:
                lis=list(user.employees)
            user.save()
            return Response({'success':'True'},HTTP_200_OK)
        except:
            return Response({'success':'False'},HTTP_400_BAD_REQUEST)

class GetLeaves(APIView):

    def get(self,request,*args,**kwargs):
        try:
            print(request.GET)
            print(kwargs)
            user=UserOrganization.objects.get(email=request.GET.get('email'))
            print(user)
            return Response({'leaves':user.Leaves_to_be_approved,'success':"True"},HTTP_200_OK)
        except:
            return Response({'success':False},HTTP_400_BAD_REQUEST)
class GetWorks(APIView):
    def get(self,request,**kwargs):
        print(request.GET.get('email'))
        try:
            user=UserOrganization.objects.get(email=request.GET.get('email'))
            return Response({'works':user.work_assigned,'success':"True"},HTTP_200_OK)
        except: 
            return Response({'success':False},HTTP_400_BAD_REQUEST)