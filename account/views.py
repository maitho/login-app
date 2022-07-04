from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.models import User, auth

# Create your views here.


def user_activity(request):
    # return HttpResponse("return this string")
    activity = User.objects.filter(is_staff=0)
    return render(request, 'user-activity.html', {'activity': activity})


def home(request):
    return render(request, 'home.html')


def logout(request):
    auth.logout(request)
    return redirect('home')
