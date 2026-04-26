import capos.*
import castillo.*
import hechisos.*



//ARTEFACTOS
object espadaDelDestino {
    var usosDeEspada = 0

    method poder(usuario) {
        if(usosDeEspada == 0){
            return  usuario.poderBase()

        }else{
            return usuario.poderBase() / self.mitadDelPoder()
        }

    }

    method mitadDelPoder() {
        return 2
    }

    method usar() {
        usosDeEspada += 1
    }

    

}

object libroDeHechisos {
    const hechisos = []

    method poder(usuario) {
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
        const hechisoUsado = self.hechisos().first()
        hechisos.remove(hechisoUsado)
    }

    method almacenarHechisos(_hechisos) {
        hechisos.addAll(_hechisos) 
    }


    method hechisos() {
        return hechisos
    }


}

object collarDivino {
    const poder = 3
    var usosEnBatalla = 0
    method poder(usuario) {
        if(self.esDebil(usuario)){
            return  poder
        }else{
            return poder + usosEnBatalla
        }
    }

    method esDebil(usuario) {
        return not (usuario.poderBase()> 6)
    }

    method usar() {
        usosEnBatalla += 1
    }

}

object armaduraDeAceroValyrio {

    method poder(usuario) {
        return 6
    }

    method usar() {
        
    }
}