from django.test import TestCase
from django.urls import reverse


class LandingPageViewTestCase(TestCase):
    def test_get(self) -> None:
        url = reverse("home")
        response = self.client.get(url)
        self.assertEquals(response.status_code, 200)
