# TTPS opción Ruby

##Ejercicio 1
  1. Arreglo (`Array`)
  ```ruby
  [].class #=> Array
  ```
  2. Diccionario o _hash_ (`Hash`)
  ```ruby
  {}.class #=> Hash
  ```
  3. String (`String`)
  ```ruby
  'un_string'.class #=> String
  ```
  4. Símbolo (`Symbol`)
  ```ruby
  :symbol.class #=> Symbol
  ```

##Ejercicio 2
   > Falso. Esta instanciando dos objetos String distintos.

##Ejercicio 3
  ```ruby
  def reemplazar(block_str)
    block_str.gsub('{','do\n').gsub('}','end\n')
  end
  ```

##Ejercicio 4
  ```ruby
  def en_palabras(time)
    hour = time.hour
    min = time.min
    case min
    when 1..10
      puts "#{hour} en punto"
    when 11..20
      puts "#{hour} y cuarto"
    when 21..34
      puts "#{hour} y media"
    when 35..44
      puts "#{hour + 1} menos veinticinco"
    when 45..55
      puts "#{hour + 1} menos cuarto"
    when 56..59
      puts "casi las #{hour + 1}"
    end
  end
  ```

##Ejercicio 5
  ```ruby
  def contar(needle, haystack)
     haystack.scan(needle).count
  end
  ```

##Ejercicio 6
  ```ruby
  def contar(needle, haystack)
    haystack.downcase.split(/\s/).select {|word| word == needle}.count
  end
  ```

##Ejercicio 7
  1. Imprimilo con sus caracteres en orden inverso.
    ```ruby
    'something'.reverse #=> "gnihtemos"
    ```

  2. Eliminá los espacios en blanco que contenga.
    ```ruby
    'something with white spaces'.delete(' ') #=> "somethingwithwhitespaces"
    ```

  3. Convertí cada uno de sus caracteres por su correspondiente valor ASCII.
    ```ruby
    'something'.chars.map(&:ord).join
    ```

  4. Cambiá las vocales por números (`a` por `4`, `e` por `3`, `i` por `1`, `o` por `0`, `u` por `6`).
    ```ruby
    reference = { 'a' => 4, 'e' => 3, 'i' => 1, 'o' => 0, 'u' => 6 }
    reference.each {|vowel, number| string.gsub!(vowel, number.to_s) }
    ```

##Ejercicio 8
  ```ruby
  => ["TTPS OPCION RUBY", "ttps opcion ruby", "Ttps opcion ruby", "ttps oPCION rUBY"]
  ```

##Ejercicio 9
  ```ruby
  def longitud(an_array)
    an_array.map {|elem| elem.length}
  end
  ```

##Ejercicio 10
  ```ruby
  def a_ul(hash)
    output = "<ul>"
    hash.each {|key,value| output += "<li>#{key}: #{value}</li>"} + "</ul>"
  end
  ```

##Ejercicio11
  ```ruby
  def rot13(a_string)
    a_string.tr("a-zA-Z", "n-za-mN-ZA-N")
  ```

##Ejercicio 12
  ```ruby
  def rot(a_string, n)
    alphabet = ('a'..'z').to_a
    a_string.scan(/[a-zA-Z]/).each {|char| a_string.gsub!(char, alphabet.rotate(n).fetch(alphabet.index(char))}
  end
  ```

##Ejercicio 13
  ```ruby
  puts 'Por favor, ingresa tu nombre:'
  input = gets.chomp
  puts "¡Hola, #{input}!"
  ```

##Ejercicio 14
  ```ruby
  def notacion_hexadecimal(rgb)
    "#" + rgb.map {|color| color.to_s(16)}.join
  end

  def notacion_entera(rgb)
    rgb.each_with_index.inject(0) {|sumador, colorindex| sumador + (colorindex[0] * 256**colorindex[1])}
  end
  ```

##Ejercicio 15
 Investigá qué métodos provee Ruby para:
  1. Conocer la lista de métodos de una clase.
  2. Conocer la lista de métodos de instancia de una clase.
  3. Conocer las variables de instancia de una clase.
  4. Obtener la lista de ancestros (_superclases_) de una clase.

##Ejercicio 16
  ```ruby
  def sum(tope)
    (1..tope).inject(0) {|total, number| total + number if number % 3 == 0 || number % 5 == 0}
  ```

##Ejercicio 17
 Cada nuevo término en la secuencia de Fibonacci es generado sumando los 2 términos anteriores. Los primeros 10
términos son: `1`, `1`, `2`, `3`, `5`, `8`, `13`, `21`, `34`, `55`. Considerando los términos en la secuencia de
Fibonacci cuyos valores no exceden los 4 millones, encontrá la suma de los términos pares.
  ```ruby
  def fibonacci(n)
    pass
  ```

##Ejercicio 18
  ```ruby
  def palindromo_mayor
    palindromos = []
    (100..999).each do |num1|
      (100..999).each do |num2|
        palindromos.push(num1*num2) if (num1*num2).to_s == (num1*num2).to_s.reverse
      end
    end
    palindromos.sort.pop
  end
  =>906609
  ```
