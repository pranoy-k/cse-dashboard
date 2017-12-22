unless Rails.env.production?
    require 'cucumber/rake/task'
    namespace :ci do
      desc 'Run all tests and generate a merged coverage report'
      task tests: [:cucumber]
    end
end