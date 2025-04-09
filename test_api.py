import unittest
from app import app

class TaskApiTestCase(unittest.TestCase):
    def setUp(self):
        self.client = app.test_client()

    def test_tasks_returns_200(self):
        response = self.client.get('/tasks')
        self.assertEqual(response.status_code, 200)

if __name__ == '__main__':
    unittest.main()