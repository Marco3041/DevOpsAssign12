from django.shortcuts import render, redirect
from .forms import RegisterForm, LoginForm
from .models import User

def home(request):
    return render(request, 'home.html')

def register(request):
    if request.method == 'POST':
        form = RegisterForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('login')
    else:
        form = RegisterForm()
    return render(request, 'register.html', {'form': form})

def login_view(request):
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data['username']
            password = form.cleaned_data['password']
            try:
                user = User.objects.get(username=username, password=password)
                request.session['user_id'] = user.id
                return redirect('home')
            except User.DoesNotExist:
                form.add_error(None, 'Invalid credentials')
    else:
        form = LoginForm()
    return render(request, 'login.html', {'form': form})
