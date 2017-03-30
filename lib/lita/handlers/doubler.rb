module Lita
  module Handlers
    class Doubler < Handler
      # insert handler code here
      #
      route /^double\s+(\d+)$/i,
        :double,
        command: true,
        help: { 'double N' => 'prints N + N' }


      def double(response)
        n = response.matches.first.first
        n = Integer(n)

        response.reply "#{n} + #{n} = #{n+n}"
      end

      Lita.register_handler(self)
    end
  end
end
