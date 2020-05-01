child(@schedules => :schedules) do
  attributes :id, :title, :description
  node(:last_occupation_updated_at) do |schedule|
    time_ago_in_words(schedule.last_occupation_updated_at)
  end

  node(:link) do |schedule|
    {
      title: t('schedules.index.link.show'),
      href: schedule_path(schedule)
    }
  end
end

child(@menu => :menu) do
  attributes :position, :title, :href, :active, :disabled
end
