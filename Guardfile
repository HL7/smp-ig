require 'guard/compat/plugin'

module ::Guard
  class MyInline < Plugin
    attr_accessor :options
    def initialize(options = {})
      super
      @options = options
    end

    def run_all
      system(options[:cmd])
    end
    def run_on_modification(paths)
      system(options[:cmd])
    end
  end
end

guard :shell  do
  watch(%r{^(input/fsh/.+\.fsh)$}) do
    `_genonce.sh`
  end

  watch(%r{^(input/pagecontent/.+\.md)$}) do
    `_genonce.sh`
  end
end
