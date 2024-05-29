# Fe23_Backend_DB
Detta projektet är en databas över kurser och studenter för Grit Academy.

Projektet består av en hemsida där man kan hämta ut data om:
1. Kurser:
- Lista över alla kurser om man tillgår url'en /courses (väljer menypunktet
kurser i navigationen)
- En specifik kurs ved att tillgå url /courses/"id" - exempel kurs nr 5: /courses/4

2. Studenter:
- Lista över alla studenter om man tillgår url'en /students (väljer menypunktet
Studenter i navigationen)
- En specifik student ved att tillgå url /students/"id" - exempel student nr 5: /students/4

3. Studenter pr. kurs
- Här var det meningen att man skulle kunde se en lista över villka studenter
som hade anmält sig till villka kurser, men har inte fått detta att fungera

Resterande uppgifter har jag tyvärr inte fått till att fungera.

API- data / JSON endpoints
1. Kurser:
Alla kurser: /api/courses
Enkelt kurs: /api/courses/"id"

2. Studenter
Alla studenter: /api/students
Enkel student: /api/students/"id"

3. Studender pr. kurs
Alla kurstilmeldingar: /api/studentsbycourses
Enkel kursanmälan: /api/studentsbycourses/"id"

Resterande api uppgifter har jag tyvärr inte fått till att fungera.