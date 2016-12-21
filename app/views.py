from django.shortcuts import render

from django.utils.translation import ugettext as _

def home(request):
    """Front UI home page"""

    context = {}
    return render(request,'index.html', context)