from api.individual.views import UserRegistrationView,UserLoginView, LeaveApplication, AllLeaves,GetempWork,Completework
from api.organization.views import OrganizationLoginView,OrganizationRegistrationView,ApproveLeaveView,AssignWorkView,AddEmployeeView,GetLeaves,GetWorks
from django.conf.urls import url
from rest_framework_jwt.views import obtain_jwt_token
from rest_framework_jwt.views import refresh_jwt_token
from rest_framework_jwt.views import verify_jwt_token

urlpatterns = [
    url(r"^signup",UserRegistrationView.as_view(),name='Signup'),
    url(r"^login",UserLoginView.as_view(),name="Login"),
    url(r"^leave",LeaveApplication.as_view(),name='Leave'),
    url(r"^getleaves",AllLeaves.as_view(),name="All_Leaves"),
    url(r"^orglogin",OrganizationLoginView.as_view(),name='org_login'),
    url(r'^org_signup',OrganizationRegistrationView.as_view(),name='org_signup'),
    url(r'^approveleave',ApproveLeaveView.as_view(),name='approve_leave'),
    url(r'^assignwork',AssignWorkView.as_view(),name='assign_work'),
    url(r'^addemp',AddEmployeeView.as_view(),name='add_emp'),
    url(r'^getorgleaves',GetLeaves.as_view(),name='get_name'),
    url(r'^getworks',GetWorks.as_view(),name='get_work'),
    url(r'^getempwork',GetempWork.as_view(),name='get_emp_work'),
    url(r'^completework',Completework.as_view(),name='complete work'),
]
