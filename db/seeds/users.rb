# frozen_string_literal: true

User.create(email: 'admin@admin.com', password: 'admin123', name: 'Admin',
            lastname: 'Admin', code: '1234567', identification_type_id: 1, document_number: '1234567890',
            contact_number: '3001111111')

User.first.add_role :director_de_comite
