import castillo.*
import artefacto.*

object rolando {
    var hogar = castillo
    const mochila = #{}
    var capacidadMaxima = 2
    const historial = []
    var poderBase = 5
    


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

        // method verificarEspacio() {
        //     if((mochila.size()> capacidadMaxima)){
        //         self.error("capacidad de la mochila llena")
        //     }
        // }

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

    //1.3 Saber qué artefactos tiene Rolando y el castillo
    method tieneEseArtefacto(_artefacto) {
        return self.artefactosQuePosee().contains(_artefacto)
    }

    method artefactosQuePosee() {
        const posesiones = self.mochila().copy()
        posesiones.addAll(hogar.artefactos())
        return posesiones
    }

    //### 2.1 Comportamiento de los artefactos

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

}



