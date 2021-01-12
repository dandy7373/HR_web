from rest_framework.serializers import ModelSerializer
from rest_framework.serializers import CharField, IntegerField, DateField, ChoiceField, DateTimeField, BooleanField, EmailField,ValidationError, ListField
from rest_framework.validators import UniqueValidator
from .models import UserOrganization
from rest_framework_jwt.settings import api_settings
from django.contrib.auth import authenticate
from django.contrib.auth.models import update_last_login


JWT_PAYLOAD_HANDLER = api_settings.JWT_PAYLOAD_HANDLER
JWT_ENCODE_HANDLER = api_settings.JWT_ENCODE_HANDLER

class OrganizationLoginSerializer(ModelSerializer):
    email=CharField()
    password=CharField()
    #token=CharField()
    class Meta:
        model=UserOrganization
        fields=('email','password')
    def validate(self,data):
        print(data)
        email=data.get('email',None)
        password=data.get('password',None)
        user=authenticate(email=email,password=password)
        if user is None:
            ValidationError('user doen\'t exit')
        try:
            payload = JWT_PAYLOAD_HANDLER(user)
            #payload['user_id'] = payload['user_id'].__str__()
            jwt_token = JWT_ENCODE_HANDLER(payload)
            update_last_login(None, user)
        except user.DoesNotExist:
            raise ValidationError("User with given email and password does not exists")
        return {"email": user.email, "token": jwt_token}


class UserOrganizationRegistrationSerializer(ModelSerializer):
    email=CharField(required=True)
    password=CharField(required=True)
    name=CharField(required=True)
    name_org=CharField(required=True)

    class Meta:
        model= UserOrganization
        fields=('email','password','name','name_org')
    def create(self,validated_data):
        user=UserOrganization.objects.create(**validated_data)
        return user
class OrganizationSerializer(ModelSerializer):
    name_org=CharField()
    email=CharField()
    name= CharField()
    tagline=CharField(required=False)
    Leaves_to_be_approved=ListField(required=False)
    work_assigned=ListField(required=False)
    password=CharField()
    phone_number=CharField(required=False)
    employees=ListField(required=False)
    class Meta:
        model=UserOrganization
        fields='__all__'