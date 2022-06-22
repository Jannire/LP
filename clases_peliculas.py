#clases - peliculas
class Film:

    cantidad = 0
    
    def __init__(self, title, director, year, studio):
        self.title = title
        self.director = director
        self.year = year
        self.studio = studio

    def info(self):
        st = " "
        st = "\nStudio: " + self.studio.name
        print("Title: " + self.title + "\nDirector: " + self.director + "\nYear: " + str(self.year) + st)

    def imprimir(self):
        print(f"<Film title = {self.title} director = {self.director}>")

    def aumentarCantidad(cls):
        cls.cantidad += 1

    def saludar(self):
        self.studio.saludar()

class Studio:
    def __init__(self, name):
        self.name = name

    def info(self):
        print(f"Studio: {self.name}")

    def saludar(self):
        print("Buenas")



Film.aumentarCantidad = classmethod(Film.aumentarCantidad)

s1 = Studio("Warner Bros")
s2 = Studio("Bold Films")
s3 = Studio("Killer Films")

f1 = Film("Inception", "Christopher Nolan", 2010, s1)
f2 = Film("Whiplash", "Damien Chazelle", 2014, s2)
f3 = Film("Carol", "Todd Haynes", 2015, s3)
f4 = Film("Tenet", "Christopher Nolan", 2020, s1)

f1.saludar()

#f1.imprimir()
#print("-------------------------------")
#print(f1.director)
#print(f2.title)
films = [f1, f2, f3, f4]

for i in films:
    i.info()
    print("")

Film.aumentarCantidad()
Film.aumentarCantidad()
Film.aumentarCantidad()
Film.aumentarCantidad()



print(f"Amount of films: {len([i for i in dir() if isinstance(eval(i), Film)])}")
