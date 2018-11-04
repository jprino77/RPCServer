namespace java server
namespace py client

 
exception NoSeEncontraronResultadosException {
    1: i32 codigo,
    2: string descripcion
}

exception GenericException {
    1: i32 codigo,
    2: string descripcion
}
 
struct Deporte {
    1: i32 id,
    2: string codigo,
    3: string descripcion
}

struct Filial {
    1: i32 id,
    2: string nombre,
    3: string calle,
    4: string altura
}

typedef string Date;

struct Usuario {
    1: string nombre,
    2: string apellido,
    3: string calle,
    4: i32 altura,
    5: i32 localidad,
    6: string telefono,
    7: string email,
    8: Date fechaNAcimiento,
    9: string usuario,
    10: string clave
}

service Service {
 
    string getNombreUsuarioFromId(1:i32 id) throws (1:NoSeEncontraronResultadosException e),
 
    bool crearUsuario(1:Usuario usuario) throws (1:GenericException e),
 
    list <Filial> buscarFiliales() throws (1:NoSeEncontraronResultadosException e),

    list <Deporte> buscarDeporteByFilialId(1:i32 filialId) throws (1:NoSeEncontraronResultadosException e),
 
    Filial getFilialById(1:i32 id) throws (1:NoSeEncontraronResultadosException e),

    Deporte getDeporteById(1:i32 id) throws (1:NoSeEncontraronResultadosException e),
}