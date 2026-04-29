import enemigos.*
import castillo.*
import artefacto.*

object rolando {
    const hogar = castillo
    const mochila = #{}
    var capacidadMaxima = 2
    const historial = []
    var poderBase = 5
    const conquistado = []

    


        method mochila() {
            return mochila
        }

        method cambiarCapasidad(nuevaCap) {
            capacidadMaxima = nuevaCap
        }


        method almacenar(_artefacto) {
            self.almacenarArtefactoSiHayEspacio(_artefacto)
            historial.add(_artefacto)
            
        }

        method almacenarArtefactoSiHayEspacio(_artefacto) {
            if(self.hayCapacidad()){
                mochila.add(_artefacto)
        
            }
        }

        method hayCapacidad() {
            return mochila.size()< capacidadMaxima
        }
            method historial() {
                return historial
            }

    //castillo

    method llegarCasa() {
        hogar.almacenar(self.mochila())
        mochila.clear()
    }
        
    method capacidadMaxima() {
        return capacidadMaxima
    }

    method hogar() {
        return hogar
    }

    method artefactosDelHogar() {
        return self.hogar().artefactos()
    }


    // Saber qué artefactos tiene Rolando y el castillo
    method artefactosQuePosee() {
        return mochila + hogar.artefactos()
    }

    method tieneEseArtefacto(_artefacto) {
        return self.artefactosQuePosee().contains(_artefacto)
    }

    // Comportamiento de los artefactos

    method batalla() {
        mochila.forEach({artefacto => artefacto.usar()})
        poderBase += 1

    }
    method poderBase() {
        return poderBase
    }

    method cambiarPoderBase(cantidad) {
        poderBase = cantidad
    }

    method poderDePelea() {
        return poderBase + self.poderArtefactos()
    }

    method poderArtefactos() {
        return mochila.sum({artefacto => artefacto.poder(self)})
    }

    method esDebil() {
        return not (self.poderBase()> 6)
    }

    //enemigos

    method puedeVencer(enemigo){
        return self.poderDePelea() > enemigo.poderDePelea()
    }

    method conquistarMorada(enemigo) {
        if(self.puedeVencer(enemigo)){
            conquistado.add(enemigo.hogar())
        }

    }

    method moradasQuePuedeConquistar(enemigos) {
        return enemigos.filter({enemigo => self.puedeVencer(enemigo)}).map({enemigo => enemigo.hogar()})
        
    }

    method conquistado() {
        return conquistado
    }

    //poderoso

    method esPoderoso(_enemigos) {
        return self.puedeVencerATodos(_enemigos)
    }

    method puedeVencerATodos(_enemigos) {
        return _enemigos.all({enemigo => self.puedeVencer(enemigo)})
    }

    //artefacto fatal

    method hayArtefactoFatal(enemigo) {
        return self.mochila().any({artefacto => artefacto.esArtefactoFatal(self,enemigo)}) 
    }

    method artefactoFatal(enemigo) {
        return self.mochila().find({artefacto => artefacto.esArtefactoFatal(self,enemigo)})
    }

}



