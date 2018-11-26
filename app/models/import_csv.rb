# データ投入のコードを記述しておくファイルを作った
# クラス、メソッドを自作
class ImportCsv < ApplicationRecord
  # CSVデータのパスを引数として受け取り、インポート処理を実行
  def self.import(path)

    # インポートするデータを格納するための配列
    list = []

     CSV.foreach(path, headers: true) do |row|
       list << {
         name: row["name"],
         age: row["age"],
         address: row["address"]
       }
     end

     User.create(list)
  end
end
