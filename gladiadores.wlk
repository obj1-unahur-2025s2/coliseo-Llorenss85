import coliseo.*
class Mirmillones {
  var vida= 100
  //utilidades
  const fuerza 
  var espada
  const escudo
  const casco
  var grupo =""
  method vida() =vida 
  method ataque() = espada + fuerza
  method atacar(unGladeador)=unGladeador.recibirDaño(self.ataque())
  method arma() =  espada
  method defensa() =self.destreza() +self.armadura() 
  method fuerza() =fuerza 
  method destreza()=15
  method armadura() = escudo.armadura() +  casco.armadura()
  method cambiarArma(unaEspada) {
    espada=unaEspada
  } 
  
  method recibirDaño(unGladeador,unAtaque) {
    vida -= self.defensa() - unAtaque
    vida= vida.min(0) //consola dicta que: -1.min(0) => 0
    self.atacar(unGladeador) 
  }
  method crearGrupo(otroGladeador) {
    grupo = new Grupo(nombre="mirmillolandia")
    grupo.agregarMiembro(self)
    grupo.agregarMiembro(otroGladeador)
  } 
  method grupoActual() =grupo
  method curar() {
    vida =100
  } 
} 

class Dimachaerus{
  var vida=100
  const armas
  var grupo=""
  var destreza
  method fuerza() =10 
  method arma() =armas
  method armadura() =0 
  method destreza() =destreza 
    method agregarArma(unArma) {
    armas.add(unArma)
  }
  method ataque() =  self.fuerza() + armas.sum()
  method defensa() =destreza/2 
  method atacar(unGladeador) {
    unGladeador.recibirDaño(self.ataque()) 
    destreza+=1
  }
  method recibirDaño(unGladeador,unAtaque) {
    vida= self.defensa() -unAtaque
    self.atacar(unGladeador) //contraAtaque
  } 
  method vida() =vida 
  method crearGrupo(otroGladeador) {
    grupo=new Grupo(nombre="D-"+self.ataque()+otroGladeador.ataque())
    grupo.agregarMiembro(self)
    grupo.agregarMiembro(otroGladeador)
    
  }
  method grupoActual() =grupo 
}