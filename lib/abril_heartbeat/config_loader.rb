module AbrilHeartbeat
  class ConfigLoader
    class << self
      attr_accessor :file_path
    end

    def self.load
      @file ||= load_file
    end

    def self.load_by_type(type)
      return load if load.empty?
      load.select { |_, v| v['type'] == type.to_s }
    end

    def self.load_file
      return {} unless file_path

      ::YAML.load_file(file_path)
    end
  end
end
