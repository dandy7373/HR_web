from djongo.models import Model, CharField, DateField, ObjectIdField, IntegerField, TextField, BooleanField, DateTimeField,ArrayField,EmailField
from django.utils import timezone
# Create your models here.
class LeavesToBeApproved(Model):
    from_date=CharField()
    from_email=CharField()
    to=CharField()
    to_date=CharField()
    reason=CharField(max_length=500)
    completed=CharField()
    class Meta:
        abstract= True
class Employees(Model):
    id=CharField()
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
class UserOrganization(Model):
    _id=ObjectIdField()
    name_org=CharField(max_length=25)
    email=EmailField(max_length=25)
    name= CharField(max_length=25)
    tagline=CharField(max_length=50)
    Leaves_to_be_approved=ArrayField(model_container=LeavesToBeApproved)
    work_assigned=ArrayField(model_container=WorkAssigned)
    password=CharField(max_length=10)
    phone_number=CharField(max_length=10)
    employees=ArrayField(model_container=Employees)

    class Meta:
        db_table='Organization'


