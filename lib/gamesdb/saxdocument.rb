class Gamesdb::SaxDocument < Nokogiri::XML::SAX::Document
  attr_reader :stack

  def initialize
    @stack = []
  end

  def characters(string)
    @value ||= ''
    @value << string.strip
  end

  def body
    @stack.first.each do |key, value|
      @stack.first[key] = [value] if value.is_a?(Hash)
    end
  end

  def end_element(name)
    last = @stack.pop
    if last.empty? && @value.empty?
      @stack.last[name] = ''
    elsif last == {:i_nil=>"true"}
      @stack.last[name] = nil
    elsif !@value.empty?
      @stack.last[name] = @value
    end
    @value = ''
  end

  def start_element(name, attributes = [])
    @value = ''
    parsed_attributes = {}
    until attributes.empty?
      if attributes.first.is_a?(Array)
        key, value = attributes.shift
      else
        key, value = attributes.shift, attributes.shift
      end
      parsed_attributes[key.gsub(':','_')] = value
    end
    if @stack.last.is_a?(Array)
      @stack.last << {name => parsed_attributes}
    else
      data = if @stack.empty?
               @stack.push(parsed_attributes)
               parsed_attributes
             elsif @stack.last[name]
               unless @stack.last[name].is_a?(Array)
                 @stack.last[name] = [@stack.last[name]]
               end
               @stack.last[name] << parsed_attributes
               @stack.last[name].last
             else
               @stack.last[name] = {}
               @stack.last[name].merge!(parsed_attributes)
               @stack.last[name]
             end
      @stack.push(data)
    end
  end
end

