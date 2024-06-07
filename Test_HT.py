from django.test import TestCase
from .models import *
from .forms import *


class TestModels(TestCase):

    def setUp(self):
        self.customer = Customer.objects.create(
            username='johndoe',
            first_name='John',
            last_name='Doe',
            email='johndoe@example.com',
            phone_number='+639123456789'
        )

    def test_customer_str(self):
        self.assertEqual(str(self.customer), 'Doe, John')

    def test_ticket_price_with_tax(self):
        tax = Tax.objects.create(amount=5)
        ticket = Ticket.objects.create(
            customer=self.customer,
            movie_title='Avengers: Endgame',
            show_time='2024-06-15 19:00',
            seat_number='A10',
            base_price=100
        )
        self.assertEqual(ticket.price_with_tax(), 105)


class TestForms(TestCase):

    def test_ticket_form_valid(self):
        form_data = {
            'customer': Customer.objects.create(
                username='janedoe',
                first_name='Jane',
                last_name='Doe',
                email='janedoe@example.com',
                phone_number='+639123456789'
            ).id,
            'movie_title': 'Avengers: Endgame',
            'show_time': '2024-06-15 19:00',
            'seat_number': 'A10',
            'base_price': 100
        }
        form = TicketForm(data=form_data)
        self.assertTrue(form.is_valid())

    def test_customer_form_valid(self):
        form_data = {
            'username': 'janedoe',
            'first_name': 'Jane',
            'last_name': 'Doe',
            'email': 'janedoe@example.com',
            'phone_number': '+639123456789'
        }
        form = CustomerForm(data=form_data)
        self.assertTrue(form.is_valid())

    def test_payment_form_valid(self):
        form_data = {
            'card_number': '4111111111111111',
            'expiry_date': '12/24',
            'cvv': '123'
        }
        form = PaymentForm(data=form_data)
        self.assertTrue(form.is_valid())
