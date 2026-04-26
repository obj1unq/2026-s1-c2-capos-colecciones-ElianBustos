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
            self.almacenarArtefacto(_artefacto)
            historial.add(_artefacto)
            
        }

        method almacenarArtefacto(_artefacto) {
            if(mochila.size()< capacidadMaxima){
                mochila.add(_artefacto)
        
            }
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

    // Saber qué artefactos tiene Rolando y el castillo
    method tieneEseArtefacto(_artefacto) {
        return self.artefactosQuePosee().contains(_artefacto)
    }

    method artefactosQuePosee() {
        const posesiones = self.mochila().copy()
        posesiones.addAll(hogar.artefactos())
        return posesiones
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
        return poderBase + self.poderArtefacto()
    }

    method poderArtefacto() {
        return mochila.sum({artefacto => artefacto.poder(self)})
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

    method conquistado() {
        return conquistado
    }

    //poderoso

    method esPoderoso() {
        return self.puedeVencer(archibaldo) && self.puedeVencer(astra) && self.puedeVencer(caterine)
    }

    //artefacto fatal

    method hayArtefactoFatal(enemigo) {
        return self.mochila().any({artefacto => artefacto.poder(self)>  enemigo.poderDePelea()}) 
    }

    method artefactoFatal(enemigo) {
        return self.mochila().find({artefacto => artefacto.poder(self)>  enemigo.poderDePelea()})
    }

}



