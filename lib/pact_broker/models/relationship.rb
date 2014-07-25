module PactBroker
  module Models

    class Relationship

      attr_reader :consumer, :provider

      def initialize consumer, provider
        @consumer = consumer
        @provider = provider
      end

      def self.create consumer, provider
        new consumer, provider
      end

      def eq? other
        Relationship === other && other.consumer == consumer && other.provider == provider
      end

      def == other
        eq?(other)
      end

      def consumer_name
        consumer.name
      end

      def provider_name
        provider.name
      end

      def pacticipants
        [consumer, provider]
      end

      def <=> other
        comp = consumer_name <=> other.consumer_name
        return comp unless comp == 0
        provider_name <=> other.provider_name
      end

    end
  end
end