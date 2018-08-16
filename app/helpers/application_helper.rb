module ApplicationHelper
  require "net/http"

  def searchShop(name, pref)
    if name.present? || pref.present?
      @name = name
      @pref = pref
      uri = URI.parse URI.encode "http://api.gnavi.co.jp/RestSearchAPI/20150630/?keyid=dd5e5cd0d6aadf49176c5e055dd05acd&format=json&name=#{@name}&pref=#{@pref}"
      @query = uri.query

      # 新しくHTTPセッションを開始し、結果をresponseへ格納
      response = Net::HTTP.start(uri.host, uri.port) do |http|
        # 接続時に待つ最大秒数を設定
        http.open_timeout = 5
        # 読み込み一回でブロックして良い最大秒数を設定
        http.read_timeout = 10
        # ここでWebAPIを叩いている
        # Net::HTTPResponseのインスタンスが返ってくる
        http.get(uri.request_uri)
      end
      # 例外処理の開始
      begin
        # responseの値に応じて処理を分ける
        case response
        # 成功した場合
        when Net::HTTPSuccess
          # responseのbody要素をJSON形式で解釈し、hashに変換
          @result = JSON.parse(response.body)

        # 別のURLに飛ばされた場合
        when Net::HTTPRedirection
          @message = "Redirection: code=#{response.code} message=#{response.message}"
        # その他エラー
        else
          @message = "HTTP ERROR: code=#{response.code} message=#{response.message}"
        end
      # エラー時処理
      rescue IOError => e
        @message = "e.message"
      rescue TimeoutError => e
        @message = "e.message"
      rescue JSON::ParserError => e
        @message = "e.message"
      rescue => e
        @message = "e.message"
      end
    else
      @result = false
    end
  end


  def searchShopId(id)
    if id.present?
      @id = id
      uri = URI.parse URI.encode "http://api.gnavi.co.jp/RestSearchAPI/20150630/?keyid=dd5e5cd0d6aadf49176c5e055dd05acd&format=json&id=#{id}"
      @query = uri.query

      # 新しくHTTPセッションを開始し、結果をresponseへ格納
      response = Net::HTTP.start(uri.host, uri.port) do |http|
        # 接続時に待つ最大秒数を設定
        http.open_timeout = 5
        # 読み込み一回でブロックして良い最大秒数を設定
        http.read_timeout = 10
        # ここでWebAPIを叩いている
        # Net::HTTPResponseのインスタンスが返ってくる
        http.get(uri.request_uri)
      end
      # 例外処理の開始
      begin
        # responseの値に応じて処理を分ける
        case response
        # 成功した場合
        when Net::HTTPSuccess
          # responseのbody要素をJSON形式で解釈し、hashに変換
          @result = JSON.parse(response.body)

        # 別のURLに飛ばされた場合
        when Net::HTTPRedirection
          @message = "Redirection: code=#{response.code} message=#{response.message}"
        # その他エラー
        else
          @message = "HTTP ERROR: code=#{response.code} message=#{response.message}"
        end
      # エラー時処理
      rescue IOError => e
        @message = "e.message"
      rescue TimeoutError => e
        @message = "e.message"
      rescue JSON::ParserError => e
        @message = "e.message"
      rescue => e
        @message = "e.message"
      end
    else
      @result = false
    end
  end


  def getAreaCode
    uri =  URI.parse URI.encode "http://api.gnavi.co.jp/master/PrefSearchAPI/20150630/?keyid=dd5e5cd0d6aadf49176c5e055dd05acd&format=json"
    response = Net::HTTP.start(uri.host, uri.port) do |http|
      # 接続時に待つ最大秒数を設定
      http.open_timeout = 5
      # 読み込み一回でブロックして良い最大秒数を設定
      http.read_timeout = 10
      # ここでWebAPIを叩いている
      # Net::HTTPResponseのインスタンスが返ってくる
      http.get(uri.request_uri)
    end
    # 例外処理の開始
    begin
      # responseの値に応じて処理を分ける
      case response
      # 成功した場合
      when Net::HTTPSuccess
        # responseのbody要素をJSON形式で解釈し、hashに変換
        @res = JSON.parse(response.body)

      # 別のURLに飛ばされた場合
      when Net::HTTPRedirection
        @message = "Redirection: code=#{response.code} message=#{response.message}"
      # その他エラー
      else
        @message = "HTTP ERROR: code=#{response.code} message=#{response.message}"
      end
    # エラー時処理
    rescue IOError => e
      @message = "e.message"
    rescue TimeoutError => e
      @message = "e.message"
    rescue JSON::ParserError => e
      @message = "e.message"
    rescue => e
      @message = "e.message"
    end
  end
end
