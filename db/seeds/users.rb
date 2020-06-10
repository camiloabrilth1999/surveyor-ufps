# frozen_string_literal: true

User.create(email: 'admin@admin.com', password: '123123123', name: 'Admin',
            lastname: 'Admin', code: '1151493', identification_type_id: 1, document_number: '1090528761',
            contact_number: '3001111111')

User.create(email: 'admin2@admin2.com', password: 'admin123', name: 'Admin2',
            lastname: 'Admin2', code: '1234567', identification_type_id: 1, document_number: '1234567890',
            contact_number: '3110001111')

User.first.add_role :director_de_comite
User.second.add_role :director_de_comite
