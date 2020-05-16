child(@schedules => :schedules) do
  attributes :id, :title, :description
  node(:last_occupation_updated_at) do |schedule|
    time_ago_in_words(schedule.last_occupation_updated_at)
  end

  node(:links) do |schedule|
    [
      {
        key: :show,
        title: t('schedules.index.links.show'),
        href: schedule_path(schedule),
        type: :success
      },
      {
        key: :config,
        title: t('schedules.index.links.config'),
        href: edit_schedule_path(schedule),
        type: :primary
      }
    ]
  end
end

node(:title) do
  t('schedules.index.title.title')
end
