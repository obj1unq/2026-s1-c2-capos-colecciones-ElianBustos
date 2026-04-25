import capos.*
import artefacto.*


// CASTILLO 

object castillo {

    const almacenamiento = #{}

        method almacenar(mochila) {
            almacenamiento.addAll(mochila)
        }


        method artefactos() {
            return almacenamiento
        }

        method agregarArtefactos(_artefactos) {
            almacenamiento.addAll(_artefactos) 
        }

    

}