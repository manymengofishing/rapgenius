define [], () ->

  @trendingJSON = [{
      "id":"t1"
      ,"song_views": 3210
      ,"annotation_count": 90
      ,"verified_count": 42
      ,"unreviewed_count": 5
    },
    {
      "id":"t2"
      ,"song_views": 2900
      ,"annotation_count": 66
      ,"verified_count": 31
      ,"unreviewed_count": 3
    },
    {
      "id":"t3"
      ,"song_views": 2421
      ,"annotation_count": 50
      ,"verified_count": 24
      ,"unreviewed_count": 3
    },
    {
      "id":"t4"
      ,"song_views": 1902
      ,"annotation_count": 44
      ,"verified_count": 14
      ,"unreviewed_count": 0
    },
    {
      "id":"t5"
      ,"song_views": 1829
      ,"annotation_count": 38
      ,"verified_count": 10
      ,"unreviewed_count": 5
    },
    {
      "id":"t6"
      ,"song_views": 1790
      ,"annotation_count": 10
      ,"verified_count": 5
      ,"unreviewed_count": 0
    }
  ]

  clearFlashes= ()->
    $(".flash").removeClass('flash')

  getTrendingStats= () ->
    for i in [0..@trendingJSON.length-1]
      if (Math.floor((Math.random()*3)+1) == 1)
        @trendingJSON[i].song_views += Math.floor((Math.random()*50)+1)
      if (Math.floor((Math.random()*10)+1) == 1)
        @trendingJSON[i].annotation_count += Math.floor((Math.random()*10)+1)
      if (Math.floor((Math.random()*20)+1) == 1)
        @trendingJSON[i].verified_count += Math.floor((Math.random()*5)+1)
      if (Math.floor((Math.random()*20)+1) == 1)
        if (Math.floor((Math.random()*2)+1) == 1)
          @trendingJSON[i].unreviewed_count += Math.floor((Math.random()*3)+1)
        else
          @trendingJSON[i].unreviewed_count -= Math.floor((Math.random()*3)+1)

    @trendingJSON

  refreshStats= (stats) ->
    $(".activity-module li").each (i,obj) =>
      if $(obj).attr('id') == stats[i].id
        if parseInt($(obj).find('.song_views').children('.count').html(),10) != stats[i].song_views
          $(obj).find('.song_views').children('.count').html(stats[i].song_views)
          $(obj).find('.song_views').addClass('flash')
        if parseInt($(obj).find('.annotation_count').children('.count').html(),10) != stats[i].annotation_count
          $(obj).find('.annotation_count').children('.count').html(stats[i].annotation_count)
          $(obj).find('.annotation_count').addClass('flash')
        if parseInt($(obj).find('.verified_count').children('.count').html(),10) != stats[i].verified_count
          $(obj).find('.verified_count').children('.count').html(stats[i].verified_count)
          $(obj).find('.verified_count').addClass('flash')
        if parseInt($(obj).find('.unreviewed_count').children('.count').html(),10) != stats[i].unreviewed_count
          $(obj).find('.unreviewed_count').children('.count').html(stats[i].unreviewed_count)
          $(obj).find('.unreviewed_count').addClass('flash')



  # constructor
  App= () =>

    console.log 'p2 ready !'

    setInterval( ->
      @stats = getTrendingStats()
      refreshStats(@stats)
      setTimeout( ->
        clearFlashes()
      , 1000)
    , 3000)

      # check if item is still in the same order



    # set timeout every 5 seconds

    # get new trendingJSON

    # assume it comes back ordered


    # if so, update count

    # if not, search what position it's at, move it there, update its count

    # if not - reorder it to its new position

  App


