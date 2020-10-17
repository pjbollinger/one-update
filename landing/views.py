from django.http import HttpRequest, HttpResponse
from django.views.generic import View


class LandingPageView(View):
    @staticmethod
    def get(_request: HttpRequest) -> HttpResponse:
        return HttpResponse("test")
