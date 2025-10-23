class Grupo{
    const nombre
    var peleasParticipadas=0
    const miembros =[]

    method agregarMiembro(unMiembro) {
        miembros.add(unMiembro)
    }
    method quitarMiembro(unMiembro) {
      miembros.remove(unMiembro)
    }
    method gladeadoresQuePuedenPelear() = miembros.filter({m => m.vida() >0})
    method campeon() =self.gladeadoresQuePuedenPelear().max({m => m.fuerza()}) 
    method aumentarPeleas() {
      peleasParticipadas+=1
    }
    method curarAlGrupo() {miembros.forEach({m => m.curar()})} 
} 

class Coliseo {
  var round =0
  const grupo1
  const grupo2
  method pasarAlSiguienteRound() {
    round+=1
  }
  method combatir() {
    grupo1.campeon().atacar(grupo2.campeon())
    round+=1
    }
  method gladeadorVsGrupo(unGladeador,grupo){
    grupo.forEach({g => g.atacar(unGladeador)})
    round+=1
  }
  method curarGladeadores(grupo) {
    grupo.curarAlGrupo()
  }
}