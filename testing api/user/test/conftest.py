# conftest.py
import pytest
from unittest.mock import create_autospec
from dependencies import DatabaseWrapper

@pytest.fixture(scope="session")
def mock_db_connection():
    # Create a mock database connection
    return create_autospec(DatabaseWrapper)
