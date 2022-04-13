from faker import Faker
fake = Faker()

import  bcrypt

def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))
    return hashed

def users_to_insert_db():
    return [
        factory_user('login'),
        factory_user('be_geek'),
        factory_user('attempt_be_geek'),
    ]

def factory_user(target):

    first_name = fake.first_name()

    data = {
        'faker': {
            'name': fake.first_name(),
            'lastname': fake.last_name(),
            'email': fake.free_email(),
            'password': 'pwd123'
        },
        'wrong_email': {
            'name': first_name,
            'lastname': fake.last_name(),
            'email': first_name.lower() + '&email.com',
            'password': 'pwd123',
        },
        'login': {
            'name': 'User',
            'lastname': 'Geek',
            'email': 'usergeek@email.com',
            'password': 'pwd123'
        },
        'be_geek': {
            'name': 'Kim',
            'lastname': 'DotCcom',
            'email': 'kim@dot.com',
            'password': 'pwd123',
            'geek_profile': {
                'whats': '11999999999',
                'desc': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pellentesque purus risus, ut ultrices mi viverra non. Suspendisse potenti. Nunc at ante facilisis, elementum massa id, consectetur nunc.',
                'printer_repair': 'Sim',
                'work': 'Remoto',
                'cost': '100'
            }
        },
        'attempt_be_geek':{
            'name': 'Dio',
            'lastname': 'Linux',
            'email': 'dio@linux.com',
            'password': 'pwd123',
            'geek_profile': {
                'whats': '11999999999',
                'desc': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce et tempor justo. Suspendisse sed ipsum ligula.',
                'printer_repair': 'Não',
                'work': 'Remoto',
                'cost': '150'
            }
        }
            
    }
    return data[target]
