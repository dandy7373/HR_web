from rest_framework.serializers import ModelSerializer
from rest_framework.serializers import CharField, IntegerField, DateField, ChoiceField, DateTimeField, BooleanField, EmailField,ValidationError, ListField
from rest_framework.validators import UniqueValidator
from .models import Userprofile,Leave
from rest_framework_jwt.settings import api_settings
from django.contrib.auth import authenticate
from django.contrib.auth.models import update_last_login


JWT_PAYLOAD_HANDLER = api_settings.JWT_PAYLOAD_HANDLER
JWT_ENCODE_HANDLER = api_settings.JWT_ENCODE_HANDLER


class UserRegistrationSerializer(ModelSerializer):
    email=EmailField(required=True, validators=[UniqueValidator(queryset=Userprofile.objects.all())])
    name=CharField(required=True)
    password=CharField(required=True)

    class Meta:
        model= Userprofile
        fields=('name','email','password')
    def create(self,validated_data):
        user=Userprofile.objects.create(**validated_data)
        return user

class Userprofileserializer(ModelSerializer):
    user=CharField()
    name=CharField()
    last_name=CharField()
    phone_number=CharField()
    department=CharField()
    email=CharField()
    salary=CharField()
    designation=CharField()
    location=CharField()
    leave=ListField()
    created_by=CharField(max_length=200)
    class Meta:
        model=Userprofile
        fields='__all__'
class LeaveSerializer(ModelSerializer):
    from_date=DateField()
    to=DateField()
    reason=CharField()
    
    class Meta:
        model=Userprofile
        fields=('leave',)


class UserLoginSerializer(ModelSerializer):
    email=CharField()
    password=CharField()
    token=CharField()

    def validate(self,data):
        email=data.get('email',None)
        password=data.get('password',None)
        user=authenticate(email=email,password=password)
        if user is None:
            raise ValidationError('user doesn;t exist')
        try:
            payload = JWT_PAYLOAD_HANDLER(user)
            #payload['user_id'] = payload['user_id'].__str__()
            jwt_token = JWT_ENCODE_HANDLER(payload)
            update_last_login(None, user)
        except Userprofile.DoesNotExist:
            raise ValidationError("User with given email and password does not exists")
        return {"email": user.email, "token": jwt_token}

    

