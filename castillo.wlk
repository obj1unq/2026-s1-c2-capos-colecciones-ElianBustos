import capos.*
import artefacto.*
import enemigos.*



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

        method poderDeArtefactoMasPoderoso(usuario) {
            return self.artefactoMasPoderoso(usuario).max()
        }

        method artefactoMasPoderoso(usuario) {
            return almacenamiento.map({artefacto=> artefacto.poder(usuario)})
        }

    

}


