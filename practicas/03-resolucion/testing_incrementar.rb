     def incrementar(x, delta= 1)
       return x+delta if ( x.is_a? Integer) && ( delta.is_a? Integer)
     else raise RuntimeError
     end
   
   
   require 'minitest/autorun'
    require 'minitest/spec'

    describe '#incrementar' do
      describe 'cuando el valor es numérico' do
        it 'incrementa el valor en un delta recibido por parámetro' do
          x = -9
          delta = 10
          assert_equal(1, incrementar(x, delta))
        end

        it 'incrementa el valor en un delta de 1 unidad por defecto' do
          x = 10
          assert_equal(11, incrementar(x))
        end
      end

      describe 'cuando el valor es un string' do
        it 'arroja un RuntimeError' do
          x = '10'
          assert_raises(RuntimeError) do
            incrementar(x)
          end
          assert_raises(RuntimeError) do
            incrementar(x, 9)
          end
        end
      end
    end
