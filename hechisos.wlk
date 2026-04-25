
object bendicion {
    const poderBase = 4

    method poder(usuario) {
        return poderBase
    }

}

object invisibilidad {
    method poder(usuario) {
        return usuario.poderBase()
    }
}

object invocacion {
    method poder(usuario) {
        return usuario.hogar().artefactos().max({artefacto => artefacto.poder(usuario)}).poder(usuario)
    }
}