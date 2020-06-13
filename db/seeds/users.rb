# frozen_string_literal: true

User.create(email: 'admin@admin.com', password: '123123123', name: 'Admin',
            lastname: 'Admin', code: '1151493', identification_type_id: 1, document_number: '1090528761',
            contact_number: '3001111111')

User.first.add_role :director_de_comite
