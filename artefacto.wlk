import capos.*
import castillo.*
import hechisos.*



//ARTEFACTOS
object espadaDelDestino {
    var usosDeEspada = 0

    method poder(usuario) {
        return self.poderDependiendoElUso(usuario)

    }

    method poderDependiendoElUso(usuario) {
        if(usosDeEspada == 0){
            return  usuario.poderBase()

        }else{
            return self.mitadDelPoder(usuario)
        }
    }

    method mitadDelPoder(usuario) {
        return usuario.poderBase() / 2
    }

    method usar() {
        usosDeEspada += 1
    }

    method esArtefactoFatal(usuario,enemigo) {
        return self.poder(usuario)>  enemigo.poderDePelea()
    }

}

object libroDeHechisos {
    const hechisos = []

    method poder(usuario) {
        return self.poderDeHechisosSiHay(usuario)
    }

    method poderDeHechisosSiHay(usuario) {
        if(not(hechisos.isEmpty())){
            const hechiso = self.hechisos().first()
            return hechiso.poder(usuario)
        }else{
            return self.sinPoder()
        }
    }

    method sinPoder() {
        return 0
    }

    method usar() {
        hechisos.remove(self.hechisos().first())
    }

    method almacenarHechisos(_hechisos) {
        hechisos.addAll(_hechisos) 
    }


    method hechisos() {
        return hechisos
    }
    method esArtefactoFatal(usuario,enemigo) {
        return self.poder(usuario)>  enemigo.poderDePelea()
    }

}

object collarDivino {
    const poder = 3
    var usosEnBatalla = 0
    method poder(usuario) {
        return poder + self.poderExtraSiNoEsDebil(usuario)

    }

    method poderExtraSiNoEsDebil(usuario) {
        if(usuario.esDebil()){
            return self.sinPoder()
        }else{
            return usosEnBatalla
        }
    }

    method sinPoder() {
        return 0
    }



    method usar() {
        usosEnBatalla += 1
    }

    method esArtefactoFatal(usuario,enemigo) {
        return self.poder(usuario)>  enemigo.poderDePelea()
    }

}

object armaduraDeAceroValyrio {

    method poder(usuario) {
        return 6
    }

    method usar() {
        
    }

    method esArtefactoFatal(usuario,enemigo) {
        return self.poder(usuario)>  enemigo.poderDePelea()
    }
}