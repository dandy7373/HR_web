from django.shortcuts import render
from rest_framework.generics import RetrieveAPIView,CreateAPIView
from rest_framework.permissions import AllowAny
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.status import HTTP_200_OK, HTTP_400_BAD_REQUEST,HTTP_201_CREATED

from .serializers import Userprofileserializer,UserRegistrationSerializer,LeaveSerializer
from .models import Userprofile
from api.organization.models import UserOrganization
from rest_framework_jwt.serializers import JSONWebTokenSerializer

# Create your views here.

class UserLoginView(APIView):
    permission_classes=[(AllowAny)]

    def get_object(self):
        print(self.request.data)
        return Userprofile.objects.all()
    
    def post(self,request):
        obj=Userprofile.objects.get(email=request.data['email'])
        if request.data['password']==obj.password:
            return Response({"success":True},status=HTTP_200_OK)
        else:
            return Response({"success":False},status=HTTP_400_BAD_REQUEST)


class UserRegistrationView(APIView):
    permission_classes=[AllowAny]

    def post(self,request,*args,**kwargs):
        if 'email' not in request.data and 'password' not in request.data and 'name' not in request.data:
            return Response({"success":"False"},status=HTTP_400_BAD_REQUEST)
        dic={}
        for i in request.data:
            dic[i]=request.data[i][0]
        user=Userprofile.objects.create(**dic)
        status_code = HTTP_201_CREATED
        response = {
            "success": "True",
            "status code": status_code,
            "message": "User registered  successfully",
        }

        return Response(response, status=status_code)
class LeaveApplication(APIView):
    permission_classes=[AllowAny]

    def post(self,request,*args,**kwargs):
        obj=Userprofile.objects.get(email=request.data['from_email'])
        user=UserOrganization.objects.get(email=obj.created_by)
        dic={}
        dic['to']=obj.created_by
        for i in request.data:
            dic[i]=request.data[i]
        
        lis=obj.leave
        if lis is None:
            lis=[]
            lis.append(dic)
            obj.leave=lis
            print(obj.leave)
            obj.save()
            leaves=user.Leaves_to_be_approved
            if leaves is None:
                user.Leaves_to_be_approved=lis
                user.save()
            else:
                leaves.append(dic)
                user.Leaves_to_be_approved=leaves
                user.save()

                
        else:
            lis.append(dic)
            obj.leave=lis
            obj.save()
            leaves=user.Leaves_to_be_approved
            if leaves is None:
                leaves=[]
                leaves.append(dic)
                user.Leaves_to_be_approved=leaves
                user.save()
            else:
                leaves.append(dic)
                user.Leaves_to_be_approved=leaves
                user.save()
        status_code=HTTP_200_OK
        response={
            'success':True,
            'status':status_code
        }
        return Response(response,status=status_code)
class AllLeaves(RetrieveAPIView):
    permission_classes=[AllowAny]
    serializer_class=Userprofileserializer

    def get(self,request):
        print(request.GET.get('email'))
        try:
            data=Userprofile.objects.get(email=request.GET.get('email'))
            return Response({'leaves':data.leave,'success':'True'},HTTP_200_OK)
        except:
            return Response({'success':'False'},HTTP_400_BAD_REQUEST)
        
class Completework(APIView):
    def post(self,request,*args,**kwargs):
        try:
            emp=Userprofile.objects.get(email=request.data['email']),
            org=UserOrganization.objects.get(email=request.data['by'])
            lis=emp.workassigned
            for i in range(len(emp.workassigned)):
                if request.data['description']==emp.workassigned[i]['description'] and request.data['due_date']==emp.workassigned[i]['due_date'] and emp.workassigned[i]['start_date']==request.data['due_date']:
                    lis[i]['completed']='1'
            emp.workassigned=lis
            org_work=org.work_assigned
            for i in range(len(org_work)):
                if request.data['description']==org.work_assigned[i]['description'] and request.data['due_date']==org.work_assigned[i]['due_date'] and org.work_assigned[i]['start_date']==request.data['due_date']:
                    org_work[i]['completed']='1'
            org.work_assigned=org_work
            emp.save()
            org.save()
            return Response({'success':'True'},HTTP_200_OK)
        except:
            return Response({'success':'False'},HTTP_400_BAD_REQUEST)
class GetempWork(APIView):
    permission_classes=[AllowAny]

    def get(self,request):
        try:
            user=Userprofile.objects.get(email=request.GET.get('email'))
            return Response({'works':user.workassigned,'success':'True'},HTTP_200_OK)
        except:
            return Response({'success':'False'},HTTP_400_BAD_REQUEST)


        
