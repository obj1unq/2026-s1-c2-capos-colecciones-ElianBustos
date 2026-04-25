import capos.*
import castillo.*



//ARTEFACTOS
object espadaDelDestino {
    var usosDeEspada = 0

    method poder(usuario) {
        if(usosDeEspada == 0){
            return  usuario.poderBase()

        }else{
            return usuario.poderBase() / 2
        }

    }

    method usar() {
        usosDeEspada += 1
    }

    

}

object libroDeHechisos {

}

object collarDivino {
    const poder = 3
    var usosEnBatalla = 0
    method poder(usuario) {
        if(not (usuario.poderBase()> 6)){
            return  poder
        }else{
            return poder + usosEnBatalla
        }
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