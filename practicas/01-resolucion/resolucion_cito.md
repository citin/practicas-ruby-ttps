### Ejercicios

> Nota: al realizar estos ejercicios no utilices las sentencias de control
> `while`, `for` ni `repeat`.

1. Investigá y probá en un intérprete de Ruby cómo crear objetos de los
   siguientes tipos básicos usando literales y usando el constructor `new`
   (cuando sea posible):
  1. Arreglo (`Array`)
  ```ruby
    arr = [] 
    arr = Array.new
   ```
  2. Diccionario o _hash_ (`Hash`)
    ```ruby
    hash = {}
    hash = Hash.new
    ```
  3. String (`String`)
   ```ruby
    str = "Hola"
   ```
  4. Símbolo (`Symbol`)
   ```ruby
    :mi_simbolo
   ```

2. ¿Qué devuelve la siguiente comparación? ¿Por qué?

   ```ruby
   'TTPS Ruby'.object_id == 'TTPS Ruby'.object_id
   
   ```

3. Escribí una función llamada `reemplazar` que reciba un `String` y que busque y reemplace en el mismo cualquier
   ocurrencia de `{` por `do\n` y cualquier ocurrencia de `}` por `\nend`, de modo que convierta los bloques escritos
   con llaves por bloques multilínea con `do` y `end`. Por ejemplo:

   ```ruby
   reemplazar("3.times { |i| puts i }")
   # => "3.times do\n |i| puts i \nend"
   ```

   ```ruby
  def reemplazar(param)
    param.gsub("{", "do\n").gsub("}", "\nend")
  end
   ```

4. Escribí una función que convierta a palabras la hora actual, dividiendo en los siguientes rangos los minutos:
  
    ```ruby
def en_palabras(horario)
case horario.min
when   (0..10) then puts "en punto"
when  (11..20) then puts "y cuarto"
when  (21..34) then puts "y media"
when  (35..44) then puts "menos veinticinco" 
when  (45..55) then puts "menos cuarto" 
when  (56..59) then puts "casi las" 
end
end
    ```

   * Si el minuto está entre 0 y 10, debe decir "en punto",
   * si el minuto está entre 11 y 20, debe decir "y cuarto",
   * si el minuto está entre 21 y 34, debe decir "y media",
   * si el minuto está entre 35 y 44, debe decir "menos veinticinco" (de la hora siguiente),
   * si el minuto está entre 45 y 55, debe decir "menos cuarto" (de la hora siguiente),
   * y si el minuto está entre 56 y 59, debe decir "casi las" (y la hora siguiente)



   Tomá como ejemplos los siguientes casos:

   ```ruby
   # A las 10:01
   en_palabras(Time.current)
   # => "Son las 10 en punto"
   # A las 9:33
   en_palabras(Time.current)
   # => "Son las 9 y media"
   # A las 9:45
   en_palabras(Time.current)
   # => "Son las 10 menos cuarto"
   # A las 6:58
   en_palabras(Time.current)
   # => "Casi son las 7"
   ```

   > Tip: resolver utilizando rangos numéricos

5. Escribí una función llamada `contar` que reciba como parámetro dos `string` y que retorne la cantidad de veces que
   aparece el segundo `string` en el primero, sin importar mayúsculas y minúsculas. Por ejemplo:

   ```ruby

   def contar(str1, str2)
     str1.downcase.scan(str2.downcase).count
   end

   contar("La casa de la esquina tiene la puerta roja y la ventana blanca.", "la")
   # => 5
   ```

6. Modificá la función anterior para que sólo considere como aparición del segundo `string` cuando se trate de palabras
   completas. Por ejemplo:

   ```ruby
   contar_palabras("La casa de la esquina tiene la puerta roja y la ventana blanca.", "la")
   # => 4
   ```

   ```ruby
   def contar_palabras(str1, str2)
     str1.downcase.split(/\s/).select {|word| word == str2.downcase}.count
   end
   ```


7. Dada una cadena cualquiera, y utilizando los métodos que provee la clase `String`, realizá las siguientes
   operaciones sobre el `string`:
  1. Imprimilo con sus caracteres en orden inverso.
   ```ruby
      puts string.reverse
   ```
  2. Eliminá los espacios en blanco que contenga.
   ```ruby
      string.gsub!("\s", "")
   ```
  3. Convertí cada uno de sus caracteres por su correspondiente valor ASCII.
   ```ruby
      string.chars.map(&:ord).join
   ```
  4. Cambiá las vocales por números (`a` por `4`, `e` por `3`, `i` por `1`, `o` por `0`, `u` por `6`).
      
   ```ruby
      reference = { 'a' => 4, 'e' => 3, 'i' => 1, 'o' => 0, 'u' => 6 }
      reference.each {|vowel, number| string.gsub!(vowel, number.to_s) }     
   ```

8. ¿Qué hace el siguiente código?

   ```ruby
   [:upcase, :downcase, :capitalize, :swapcase].map do |meth|
     "TTPS Opción Ruby".send(meth)
   end
   ```
    
9. Escribí una función que dado un arreglo que contenga varios `string` cualesquiera, retorne un nuevo arreglo donde
   cada elemento es la longitud del `string` que se encuentra en la misma posición del arreglo recibido como parámetro.
   Por ejemplo:

    ```ruby
    longitud(['TTPS', 'Opción', 'Ruby', 'Cursada 2015'])
    # => [4, 6, 4, 12]
    ```

10. Escribí una función llamada `a_ul` que reciba un `Hash` y retorne un `String` con los pares de clave/valor del hash
    formateados en una lista HTML `<ul>`. Por ejemplo:

    ```ruby
    a_ul({ perros: 1, gatos: 1, peces: 0})
    # => "<ul><li>perros: 1</li><li>gatos: 1</li><li>peces: 0</li></ul>"
    ```
   ```ruby
    def a_ul(hash)
      output= "<ul>"
      hash.each {|key, value| output += "<li>#{key}: #{value}</li>"}
      output + "</ul>"
    end
   ```

11. Escribí una función llamada `rot13` que _encripte_ un `string` recibido como parámetro utilizando el algoritmo
    [`ROT13`](https://es.wikipedia.org/wiki/ROT13). Por ejemplo:

    ```ruby
    rot13("¡Bienvenidos a la cursada 2015 de TTPS Opción Ruby!")
    # => "¡Ovrairavqbf n yn phefnqn 2015 qr GGCF Bcpvóa Ehol!"
    ```
    ```ruby
    def rot13(str)
      str.tr!("abcdefghijklmnopqrstuvwxyz", "nopqrstuvwxyzabcdefghijklm")
      end
    ```

12. Escribí una función más genérica, parecida a la del ejercicio anterior, que reciba como parámetro un `string` y un
    número `n`, y que realice una _rotación_ de `n` lugares de las letras del `string` y retorne el resultado. Por
    ejemplo:

    ```ruby
    rot("¡Bienvenidos a la cursada 2015 de TTPS Opción Ruby!", 13)
    # => "¡Ovrairavqbf n yn phefnqn 2015 qr GGCF Bcpvóa Ehol!"
    ```

    ```ruby
   def rot(num = 13)
       return self.split("").collect { |ch|
          if /^[a-z]$/ === ch
              ((ch[0] + num - 'a'[0]) % 26 + 'a'[0]).chr
          elsif /^[A-Z]$/ === ch
              ((ch[0] + num - 'A'[0]) % 26 + 'A'[0]).chr
          else
              ch
          end
                                         }.join("")
       end  
   
      
    ```
13. Escribí un _script_ en Ruby que le pida al usuario su nombre y lo utilice para saludarlo imprimiendo en pantalla
    `¡Hola, <nombre>!`. Por ejemplo:

    ```bash
    $ ruby script.rb
    Por favor, ingresá tu nombre:
    Matz
    ¡Hola, Matz!
    ```

    ```ruby
    puts "Por favor, ingresa tu nombre:"
    read = gets.chomp
    puts "Hola #{read}!"
    ```
14. Dado un color expresado en notación [RGB](https://es.wikipedia.org/wiki/RGB), debés calcular su representación
    entera y hexadecimal, donde la notación _entera_ se define como `red + green*256 + blue*256*256` y la _hexadecimal_
    como el resultado de expresar en hexadecimal el valor de cada color y concatenarlos en orden. Por ejemplo:

    ```ruby
    notacion_hexadecimal([0, 128, 255])
    # => '#0080FF'
    notacion_entera([0, 128, 255])
    # => 16744448
    ```
    
   ```ruby
    def notacion_hexa(array)
      "#" + array.map{ |color| color.to_s(16).upcase}.join
    end
    def notacion_entera(array)
     array.inject(0) {|color, index| color * 256^index } 
    ```
15. Investigá qué métodos provee Ruby para:
  1. Conocer la lista de métodos de una clase.
   ```ruby
      .methods
   ```
  2. Conocer la lista de métodos de instancia de una clase.
   ```ruby
      .instance_methods
   ```
  3. Conocer las variables de instancia de una clase.
   ```ruby
      .instance_variables
   ```
  4. Obtener la lista de ancestros (_superclases_) de una clase.
   ```ruby
      .ancestors
   ```

16. Escribí una función que encuentre la suma de todos los números naturales múltiplos de `3` ó `5` menores que un
    número `tope` que reciba como parámetro.
     
    ```ruby
    def suma_rara(n)
        (1..n).inject(0) {|suma, x| suma + x if ( x % 3 == 0 || x % 5 == 0)  }
    end 
    ```
17. Cada nuevo término en la secuencia de Fibonacci es generado sumando los 2 términos anteriores. Los primeros 10
    términos son: `1`, `1`, `2`, `3`, `5`, `8`, `13`, `21`, `34`, `55`. Considerando los términos en la secuencia de
    Fibonacci cuyos valores no exceden los 4 millones, encontrá la suma de los términos pares.
      
    ```ruby
          fib = [0,1]
          33.times do |i|
            if i > 1
              fib.push(fib[i-1] + fib[i-2])
            end
          end
    ```

18. Un número _palíndromo_ se lee igual al derecho y al revés. El número palíndromo más grande obtenido de la
    multiplicación de dos números de 2 dígitos es `9009` (`91 * 99 = 9009`). Encontrá el palíndromo más grande obtenido a
    través de la multiplicación de dos números de 3 dígitos.
    
    ```ruby
    def ej18
      (100..999).each { |num1|
        (100..999).each { |num2|
          resultado = num1 * num2 if (num1 * num2).to_s == (num1 * num2).to_s.reverse && num1*num2 > resultado
        }
      }
    end
    ```
