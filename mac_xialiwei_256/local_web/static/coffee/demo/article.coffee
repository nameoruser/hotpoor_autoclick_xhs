root = exports ? this
# !!!! Hotpoor root object
root.Hs or= {}
Hs = root.Hs

$ ->
    console.log "article coffee"

    $("body").on "click",".get_info",(evt)->
        dom  = $(this)
        dom.text("解析中")

        $.ajax
            url:"/api/tool/article/get_info"
            type: "GET"
            dataType: "json"
            data:
                short_link:$("input[data-name=short_link]").val()
            success:(data)->
                dom.text("查询")
                if data.info == "ok"
                    result = data.result
                    $("input[data-name=json_file]").val(result["t"])
                    $("input[data-name=article_title]").val(result["title"])
                    $("textarea[data-name=article_content]").val(result["content"])
                    $(".line_images").empty()
                    time_now = (new Date()).getTime()
                    for i in result["image_links"]
                        $(".line_images").append """
                            <div><img class="line_images_div_img" src="#{i}"></div>
                        """
            error:(data)->
                dom.text("解析失败")
    $("body").on "click",".get_json",(evt)->
        dom  = $(this)
        dom.text("解析中")

        $.ajax
            url:"/api/tool/article/get_json"
            type: "GET"
            dataType: "json"
            data:
                t:$("input[data-name=json_file]").val()
            success:(data)->
                dom.text("查询")
                if data.info == "ok"
                    result = data.result
                    $("input[data-name=article_title]").val(result["title"])
                    $("textarea[data-name=article_content]").val(result["content"])
                    $(".line_images").empty()
                    time_now = (new Date()).getTime()
                    for i in result["image_links"]
                        $(".line_images").append """
                            <div><img class="line_images_div_img" src="#{i}"></div>
                        """
            error:(data)->
                dom.text("解析失败")