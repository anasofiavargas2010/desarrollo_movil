# Investigación de widgets fundamentales en Flutter

**Nombre del estudiante:** Ana Sofia Vargas Gaviria<br>
**Curso:** Lenguajes de programación para móviles <br>
**Fecha:** 17 de mayo de 2026<br>

---

## 1. `Scaffold`

### Descripción

El widget `Scaffold` es la estructura base de casi cualquier pantalla en Flutter. Proporciona un esqueleto visual completo que incluye zonas predefinidas para una barra superior (`AppBar`), un cuerpo principal (`body`), un botón flotante (`floatingActionButton`), una barra de navegación inferior (`bottomNavigationBar`) y un cajón lateral (`drawer`), entre otros.

Es uno de los primeros widgets que se coloca al construir una nueva pantalla, ya que sin él sería necesario definir manualmente cada uno de esos espacios. En pocas palabras, `Scaffold` ahorra tiempo y garantiza que la interfaz siga las guías de Material Design de forma automática.

### Ejemplo de código

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Mi primera pantalla'),
      ),
      body: Center(
        child: Text('¡Bienvenido a Flutter!'),
      ),
    ),
  ));
}
```

### Explicación del ejemplo

En este ejemplo, `Scaffold` actúa como el contenedor principal de la pantalla. En la propiedad `appBar` se coloca un widget `AppBar` con el título de la pantalla. En la propiedad `body` se coloca un `Center` que centra un texto en la pantalla. Al ejecutar este código, se verá una pantalla con una barra superior azul y el mensaje centrado en el área principal.

### Personalización

| Propiedad | Descripción | Ejemplo |
|---|---|---|
| `appBar` | Define la barra superior de la pantalla. | `appBar: AppBar(title: Text('Título'))` |
| `body` | Define el contenido principal de la pantalla. | `body: Center(child: Text('Hola'))` |
| `backgroundColor` | Cambia el color de fondo de la pantalla. | `backgroundColor: Colors.grey[100]` |
| `floatingActionButton` | Agrega un botón flotante sobre el contenido. | `floatingActionButton: FloatingActionButton(...)` |
| `drawer` | Agrega un menú lateral deslizable. | `drawer: Drawer(child: ...)` |
| `bottomNavigationBar` | Agrega una barra de navegación en la parte inferior. | `bottomNavigationBar: BottomNavigationBar(...)` |

### Ejemplo con personalización

```dart
Scaffold(
  backgroundColor: Colors.grey[100],
  appBar: AppBar(
    title: Text('Pantalla personalizada'),
    backgroundColor: Colors.indigo,
    centerTitle: true,
  ),
  body: Center(
    child: Text(
      'Contenido principal',
      style: TextStyle(fontSize: 20, color: Colors.indigo),
    ),
  ),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    backgroundColor: Colors.indigo,
    child: Icon(Icons.add, color: Colors.white),
  ),
)
```

### Explicación de la personalización

En este ejemplo, se cambia el color de fondo de la pantalla a un gris claro con `backgroundColor`. La `AppBar` se personaliza con color índigo y el título centrado. Además, se agrega un `FloatingActionButton` con un ícono de suma, también en color índigo, para mantener consistencia visual. Este tipo de personalización es muy común para dar identidad visual a la aplicación.

### Conclusión

`Scaffold` es fundamental en Flutter porque proporciona la estructura visual estándar de una pantalla. Sin él, cada desarrollador tendría que crear manualmente los espacios para la barra superior, el cuerpo y los elementos flotantes. Su uso asegura coherencia con Material Design y acelera el desarrollo de interfaces completas.

---

## 2. `Row` y `Column`

### Descripción

`Row` y `Column` son widgets de disposición que organizan sus elementos hijos de forma horizontal (`Row`) o vertical (`Column`). Son el equivalente en Flutter de los conceptos de filas y columnas en diseño web o de los layouts lineales en Android.

Se utilizan constantemente para distribuir y alinear elementos dentro de una pantalla. Por ejemplo, `Row` es ideal para colocar un ícono junto a un texto, mientras que `Column` es útil para apilar secciones de un formulario o de una tarjeta de información.

### Ejemplo de código

```dart
// Ejemplo de Column
Column(
  children: [
    Text('Primer elemento'),
    Text('Segundo elemento'),
    Text('Tercer elemento'),
  ],
)

// Ejemplo de Row
Row(
  children: [
    Icon(Icons.star, color: Colors.amber),
    Text(' 4.8 estrellas'),
  ],
)
```

### Explicación del ejemplo

El primer bloque muestra una `Column` que apila tres textos uno sobre el otro de forma vertical. El segundo bloque muestra una `Row` que coloca un ícono de estrella y un texto de calificación uno al lado del otro de forma horizontal. Ambos widgets reciben sus elementos a través de la propiedad `children`, que acepta una lista de widgets.

### Personalización

| Propiedad | Descripción | Ejemplo |
|---|---|---|
| `mainAxisAlignment` | Controla la alineación en el eje principal (horizontal en `Row`, vertical en `Column`). | `mainAxisAlignment: MainAxisAlignment.center` |
| `crossAxisAlignment` | Controla la alineación en el eje secundario. | `crossAxisAlignment: CrossAxisAlignment.start` |
| `children` | Lista de widgets hijos que se distribuyen. | `children: [Text('A'), Text('B')]` |
| `mainAxisSize` | Define si el widget ocupa el máximo espacio o solo el necesario. | `mainAxisSize: MainAxisSize.min` |

### Ejemplo con personalización

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(Icons.home, size: 40, color: Colors.blue),
        Icon(Icons.search, size: 40, color: Colors.blue),
        Icon(Icons.person, size: 40, color: Colors.blue),
      ],
    ),
    SizedBox(height: 16),
    Text(
      'Barra de navegación personalizada',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  ],
)
```

### Explicación de la personalización

En este ejemplo, una `Column` centra su contenido verticalmente. Dentro de ella, una `Row` distribuye tres íconos de forma equidistante usando `MainAxisAlignment.spaceEvenly`. Debajo de los íconos se agrega un `SizedBox` para separación y un texto descriptivo. Este patrón (combinar `Row` dentro de `Column`) es muy habitual en Flutter para crear layouts complejos a partir de estructuras simples.

### Conclusión

`Row` y `Column` son los widgets de layout más usados en Flutter. Dominan la composición de casi todas las interfaces porque permiten organizar elementos de forma clara y predecible. Conocer sus propiedades de alineación es esencial para construir pantallas bien estructuradas y responsivas.

---

## 3. `Text`

### Descripción

El widget `Text` es el widget principal para mostrar texto en Flutter. Permite mostrar cadenas de caracteres con distintos estilos: tamaño de fuente, color, negrita, cursiva, alineación, número máximo de líneas, entre otros.

Es uno de los widgets más básicos e indispensables, ya que prácticamente toda interfaz necesita mostrar algún tipo de texto, ya sea un título, una descripción, un precio, un mensaje de error o cualquier otro contenido textual.

### Ejemplo de código

```dart
Text('Hola, Flutter!')
```

### Explicación del ejemplo

Este es el uso más sencillo de `Text`: basta con pasarle la cadena de texto que se desea mostrar. Flutter se encarga de renderizarlo con el estilo predeterminado del tema de la aplicación.

### Personalización

| Propiedad | Descripción | Ejemplo |
|---|---|---|
| `style` | Aplica estilos al texto mediante `TextStyle`. | `style: TextStyle(fontSize: 20)` |
| `textAlign` | Controla la alineación horizontal del texto. | `textAlign: TextAlign.center` |
| `maxLines` | Limita el número de líneas visibles. | `maxLines: 2` |
| `overflow` | Define qué hacer cuando el texto no cabe. | `overflow: TextOverflow.ellipsis` |
| `softWrap` | Indica si el texto puede hacer saltos de línea automáticos. | `softWrap: true` |

Propiedades de `TextStyle` más usadas:

| Propiedad | Descripción | Ejemplo |
|---|---|---|
| `fontSize` | Tamaño de la fuente. | `fontSize: 18` |
| `fontWeight` | Grosor de la fuente. | `fontWeight: FontWeight.bold` |
| `color` | Color del texto. | `color: Colors.red` |
| `fontStyle` | Estilo de la fuente (normal o cursiva). | `fontStyle: FontStyle.italic` |
| `letterSpacing` | Espacio entre letras. | `letterSpacing: 1.5` |

### Ejemplo con personalización

```dart
Text(
  'Bienvenido a la aplicación',
  textAlign: TextAlign.center,
  maxLines: 2,
  overflow: TextOverflow.ellipsis,
  style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.deepPurple,
    letterSpacing: 1.2,
  ),
)
```

### Explicación de la personalización

En este ejemplo, el texto está centrado, limitado a un máximo de 2 líneas y, si el contenido es muy largo, se trunca con puntos suspensivos (`ellipsis`). El estilo define un tamaño de fuente grande, negrita, color morado oscuro y un espaciado entre letras ligeramente ampliado. Este tipo de configuración es habitual en títulos o encabezados de pantallas.

### Conclusión

`Text` es uno de los widgets más esenciales de Flutter. Sin la capacidad de mostrar texto, ninguna aplicación podría comunicar información al usuario. Conocer sus opciones de estilo permite construir interfaces con jerarquía visual clara y buena legibilidad.

---

## 4. `ElevatedButton`

### Descripción

`ElevatedButton` es el widget de botón elevado (con sombra) de Flutter dentro del sistema de Material Design. Se utiliza para representar la acción principal de una pantalla, como confirmar un formulario, iniciar sesión, guardar datos o navegar a otra sección.

Su nombre hace referencia al efecto de elevación (sombra) que lo distingue visualmente del fondo, lo que indica al usuario que es un elemento interactivo. Desde Flutter 2.0, reemplazó al antiguo widget `RaisedButton`.

### Ejemplo de código

```dart
ElevatedButton(
  onPressed: () {
    print('Botón presionado');
  },
  child: Text('Aceptar'),
)
```

### Explicación del ejemplo

Este ejemplo muestra un botón con la etiqueta "Aceptar". Cuando el usuario lo presiona, se ejecuta la función anónima dentro de `onPressed`, que en este caso imprime un mensaje en la consola. Si `onPressed` es `null`, el botón se deshabilita automáticamente y aparece atenuado.

### Personalización

| Propiedad | Descripción | Ejemplo |
|---|---|---|
| `onPressed` | Función que se ejecuta al presionar el botón. | `onPressed: () { ... }` |
| `child` | Widget que se muestra dentro del botón (generalmente un `Text` o `Icon`). | `child: Text('Guardar')` |
| `style` | Permite personalizar colores, tamaño, forma y elevación. | `style: ElevatedButton.styleFrom(...)` |
| `backgroundColor` | Color de fondo del botón (dentro de `styleFrom`). | `backgroundColor: Colors.green` |
| `foregroundColor` | Color del texto e íconos del botón. | `foregroundColor: Colors.white` |
| `minimumSize` | Tamaño mínimo del botón. | `minimumSize: Size(200, 50)` |
| `shape` | Define la forma del borde del botón. | `shape: RoundedRectangleBorder(...)` |

### Ejemplo con personalización

```dart
ElevatedButton(
  onPressed: () {
    print('Formulario enviado');
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.teal,
    foregroundColor: Colors.white,
    minimumSize: Size(double.infinity, 52),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    elevation: 4,
  ),
  child: Text(
    'Enviar formulario',
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  ),
)
```

### Explicación de la personalización

En este ejemplo, el botón ocupa todo el ancho disponible (`double.infinity`) y tiene una altura de 52 píxeles. Su color de fondo es verde azulado (`teal`) y el texto es blanco. Los bordes están redondeados con un radio de 12 píxeles y tiene una sombra de elevación de 4 unidades. Este diseño es muy habitual en botones de confirmación dentro de formularios.

### Conclusión

`ElevatedButton` es el widget de acción principal en Flutter. Su diseño elevado lo hace visualmente prominente, guiando al usuario hacia la acción más importante de la pantalla. Gracias a `styleFrom`, se puede personalizar completamente para adaptarse a la identidad visual de cualquier aplicación.

---

## 5. `ListView`

### Descripción

`ListView` es el widget de desplazamiento vertical (scroll) más utilizado en Flutter. Permite mostrar una lista de elementos que puede extenderse más allá del tamaño visible de la pantalla, habilitando el desplazamiento automático para que el usuario pueda explorar todo el contenido.

Se usa en casos como listas de productos, feeds de noticias, chats, listas de contactos, menús de configuración o cualquier colección de elementos que requiera scroll. Existen varias variantes: `ListView` (lista estática), `ListView.builder` (lista dinámica y eficiente) y `ListView.separated` (lista con separadores).

### Ejemplo de código

```dart
ListView(
  children: [
    ListTile(title: Text('Elemento 1')),
    ListTile(title: Text('Elemento 2')),
    ListTile(title: Text('Elemento 3')),
    ListTile(title: Text('Elemento 4')),
    ListTile(title: Text('Elemento 5')),
  ],
)
```

### Explicación del ejemplo

En este ejemplo, `ListView` contiene cinco `ListTile`, que son widgets prediseñados para elementos de lista con título, subtítulo e íconos opcionales. Al agregar más elementos de los que caben en pantalla, `ListView` habilita el scroll automáticamente sin necesidad de configuración adicional.

### Personalización

| Propiedad | Descripción | Ejemplo |
|---|---|---|
| `children` | Lista estática de widgets hijos. | `children: [Widget1, Widget2]` |
| `scrollDirection` | Define si el scroll es vertical u horizontal. | `scrollDirection: Axis.horizontal` |
| `padding` | Agrega espacio interno alrededor de la lista. | `padding: EdgeInsets.all(16)` |
| `physics` | Controla el comportamiento del scroll. | `physics: BouncingScrollPhysics()` |
| `itemBuilder` | En `ListView.builder`, construye cada elemento dinámicamente. | `itemBuilder: (context, index) => ...` |
| `itemCount` | En `ListView.builder`, indica el número total de elementos. | `itemCount: 20` |
| `separatorBuilder` | En `ListView.separated`, define el separador entre elementos. | `separatorBuilder: (context, index) => Divider()` |

### Ejemplo con personalización

```dart
ListView.separated(
  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  itemCount: 5,
  separatorBuilder: (context, index) => Divider(color: Colors.grey[300]),
  itemBuilder: (context, index) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.indigo,
        child: Text(
          '${index + 1}',
          style: TextStyle(color: Colors.white),
        ),
      ),
      title: Text(
        'Elemento ${index + 1}',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text('Descripción del elemento ${index + 1}'),
      trailing: Icon(Icons.chevron_right, color: Colors.grey),
      onTap: () {
        print('Elemento ${index + 1} seleccionado');
      },
    );
  },
)
```

### Explicación de la personalización

En este ejemplo se usa `ListView.separated`, que genera la lista de forma dinámica con `itemBuilder` (construye cada elemento según su índice) y agrega un `Divider` gris entre cada elemento con `separatorBuilder`. Cada `ListTile` muestra un número en un avatar circular, un título en negrita, un subtítulo descriptivo y una flecha al final. Al tocar un elemento, se imprime un mensaje en consola. Este patrón es muy común en aplicaciones de listados como catálogos, chats o configuraciones.

### Conclusión

`ListView` es indispensable en Flutter para mostrar colecciones de datos que requieren scroll. Su variante `ListView.builder` es especialmente importante porque construye los elementos bajo demanda (lazy loading), lo que garantiza un rendimiento eficiente incluso con miles de elementos. Dominar `ListView` es clave para construir aplicaciones con contenido dinámico y extenso.

---

## 6. `TextField`

### Descripción

`TextField` es el widget de entrada de texto en Flutter. Permite al usuario escribir información desde el teclado del dispositivo. Es fundamental en formularios de registro, inicio de sesión, búsqueda, chats y cualquier pantalla donde se necesite capturar datos del usuario.

`TextField` se puede controlar con un objeto `TextEditingController`, que permite leer el texto ingresado, limpiarlo o modificarlo desde el código. También admite validación, formateo automático, límite de caracteres y distintos tipos de teclado (numérico, de correo electrónico, de contraseña, etc.).

### Ejemplo de código

```dart
TextField(
  decoration: InputDecoration(
    labelText: 'Nombre',
    hintText: 'Escribe tu nombre aquí',
  ),
)
```

### Explicación del ejemplo

En este ejemplo, `TextField` muestra un campo de texto con una etiqueta flotante (`labelText`) que indica qué dato se debe ingresar y un texto de sugerencia (`hintText`) que aparece cuando el campo está vacío. Al tocar el campo, el teclado del dispositivo se abre automáticamente.

### Personalización

| Propiedad | Descripción | Ejemplo |
|---|---|---|
| `controller` | Controla y lee el contenido del campo. | `controller: TextEditingController()` |
| `decoration` | Personaliza la apariencia del campo con `InputDecoration`. | `decoration: InputDecoration(labelText: 'Email')` |
| `keyboardType` | Define el tipo de teclado que se muestra. | `keyboardType: TextInputType.emailAddress` |
| `obscureText` | Oculta el texto (útil para contraseñas). | `obscureText: true` |
| `maxLines` | Permite varias líneas de texto. | `maxLines: 4` |
| `maxLength` | Límite máximo de caracteres. | `maxLength: 100` |
| `onChanged` | Función que se ejecuta cada vez que el texto cambia. | `onChanged: (value) { ... }` |
| `onSubmitted` | Función que se ejecuta cuando el usuario confirma la entrada. | `onSubmitted: (value) { ... }` |

### Ejemplo con personalización

```dart
final TextEditingController _emailController = TextEditingController();

TextField(
  controller: _emailController,
  keyboardType: TextInputType.emailAddress,
  maxLength: 60,
  decoration: InputDecoration(
    labelText: 'Correo electrónico',
    hintText: 'ejemplo@correo.com',
    prefixIcon: Icon(Icons.email, color: Colors.teal),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.teal, width: 2),
    ),
  ),
  onChanged: (value) {
    print('Texto actual: $value');
  },
)
```

### Explicación de la personalización

En este ejemplo, el campo está configurado para recibir correos electrónicos (`emailAddress`), con un límite de 60 caracteres. Se usa un `TextEditingController` para poder leer el valor ingresado desde el código. La decoración incluye un ícono de correo al inicio, bordes redondeados y un borde de color `teal` cuando el campo está activo (en foco). Cada vez que el usuario escribe, `onChanged` imprime el valor actual en consola. Este tipo de configuración es típica en formularios de inicio de sesión o registro.

### Conclusión

`TextField` es el widget de entrada de datos más importante de Flutter. Sin él, no sería posible construir formularios ni capturar información del usuario. Su amplia variedad de propiedades permite adaptarlo a cualquier tipo de dato: texto libre, contraseñas, correos, números o mensajes largos, lo que lo convierte en un widget imprescindible en cualquier aplicación real.
