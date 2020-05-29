#Create Faculties
Faculty.create(name: "Educación, Artes y Humanidades", code: "900")
Faculty.create(name: "Ingenieria", code: "100")
Faculty.create(name: "Ciencias de la salud", code: "300")

#Create Academic programs
AcademicProgram.create(name: "Comunicacion Social", code: "901", email: "comunicacionsocial@ufps.edu.co", faculty_id: 1)
AcademicProgram.create(name: "Trabajo Social", code: "903", email: "trabajosocial@ufps.edu.co", faculty_id: 1)
AcademicProgram.create(name: "Derecho", code: "902", email: "derecho@ufps.edu.co", faculty_id: 1)

AcademicProgram.create(name: "Ingenieria de sistemas", code: "115", email: "ingsistemas@ufps.edu.co", faculty_id: 2)
AcademicProgram.create(name: "Ingenieria civil", code: "111", email: "ingcivil@ufps.edu.co", faculty_id: 2)
AcademicProgram.create(name: "Ingenieria industrial", code: "119", email: "ingindustrial@ufps.edu.co", faculty_id: 2)

AcademicProgram.create(name: "Enfermeria", code: "301", email: "enfermeria@ufps.edu.co", faculty_id: 3)
AcademicProgram.create(name: "Seguridad y Salud en el Trabajo", code: "111", email: "segsalud@ufps.edu.co", faculty_id: 3)

#Create Academic departaments
AcademicDepartament.create(name: "Departamento de Arquitectura", code: "951", faculty_id: 1)
AcademicDepartament.create(name: "Departamento de Humanidades Sociales", code: "952", faculty_id: 1)

AcademicDepartament.create(name: "Departamento Construcciones Civiles", code: "151", faculty_id: 2)
AcademicDepartament.create(name: "Departamento Fluidos y Térmicas", code: "152", faculty_id: 2)

AcademicDepartament.create(name: "Departamento Ciencias de la salud", code: "351", faculty_id: 3)
