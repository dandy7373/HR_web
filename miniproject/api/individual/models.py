from djongo.models import Model, CharField, DateField, ObjectIdField, IntegerField, TextField, BooleanField, DateTimeField, ArrayField
from django.utils import timezone
# Create your models here.
class Leave(Model):
    from_date=CharField()
    from_email=CharField()
    to=CharField()
    to_date=CharField()
    reason=CharField(max_length=500)
    completed=CharField()
    

    class Meta:
        abstract=True
class WorkAssigned(Model):
    description=CharField()
    due_date=CharField()
    start_date=CharField()
    by=CharField()
    completed=CharField()
    class Meta:
        abstract=True
    
class Userprofile(Model):
    _id=ObjectIdField(max_length=254)
    user=CharField(max_length=254)
    name=CharField(max_length=254)
    last_name=CharField(max_length=254)
    password=CharField(max_length=25)
    phone_number=CharField(max_length=10)
    department=CharField(max_length=50)
    email=CharField(max_length=25)
    salary=CharField(max_length=50)
    designation=CharField(max_length=25)
    location=CharField(max_length=25)
    leave=ArrayField(model_container=Leave)
    created_by=CharField(max_length=200)
    workassigned=ArrayField(model_container=WorkAssigned)

    class Meta:
        db_table='Individual'
