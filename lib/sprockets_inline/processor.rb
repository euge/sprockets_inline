module SprocketsInline
  
  class Processor < Tilt::Template

    # regexp for detecting a JS statement
    # Examples:
    # //= inline "bob"
    # //  =inline "bob"
    #   //  = inline "bob"
    # and all sorts of other wierd combos
    JS_DIRECTIVE_PATTERN = /
      ^\s* \/\/ \s* = \s* (\w+.*?) $
    /x

    # regexp for extracting the indent
    INDENT = /^(\s*)/

    def prepare
    end

    def evaluate(context, locals, &block)
      @context = context
      @result  = ""

      data.lines.each do |line|
        if directive = get_directive(line)
          process_directive(directive)
        else
          @result << line
        end
      end

      @result
    end

    def get_directive(line)
      if directive = line[JS_DIRECTIVE_PATTERN, 1]
        name, *args = Shellwords.shellwords(directive)
        if respond_to?("process_#{name}_directive", true)
          return { :name => name, :args => args, :line => line }
        end
      end

      return nil
    end

    def process_directive(directive)
      send("process_#{directive[:name]}_directive", directive)
    end

    def process_inline_directive(directive)
      content = @context.evaluate(directive[:args][0])

      # preserve indenting of the directive
      indent = directive[:line][INDENT, 1]
      @result << content.lines.map { |c| indent + c }.join
    end
  end
  
end