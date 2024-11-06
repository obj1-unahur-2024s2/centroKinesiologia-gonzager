object centro {
    const pacientes=[]
    const aparatos=[]

    method agregarPacientes(unaLista){
        pacientes.addAll(unaLista)
    }

    method agregarAparatos(unaLista) {
        aparatos.addAll(unaLista)
    }

    method colorAparatos() =
        aparatos.map({a=> a.color()}).asSet()
    
    method pacientesMenoresA(unValor) =
        pacientes.filter({ p=>p.edad()< unValor})

    method cantNoPuedenCumplirRutina() =
        pacientes.count( 
            {p=> not p.puedeHacerRutina()}
        )  

    method optimas() = aparatos.all { a=> not a.necesitaMantenimiento()}

    method estoyComplicado() = 
        self.cantNecesitanMantenimiento() >= aparatos.size().div(2)

    method cantNecesitanMantenimiento(){
        return aparatos.count { a=> a.necesitaMantenimiento() }
    }

    method realizarMantenimiento() {
        self.aparatosQueNecesitanMantenimiento()
        .forEach({a=>a.realizarMantenimietno()})
    }

    method aparatosQueNecesitanMantenimiento() =
        aparatos.filter({a=> a.necesitaMantenimiento()})

}