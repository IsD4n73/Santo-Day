


class SantoModel {
 String? nome;
 String? tipologia;
 String? data;
 String? defaults;
 String? permalink;
 String? urlimmagine;
 String? descrizione;

 SantoModel({this.nome, this.tipologia, this.data, this.defaults, this.permalink, this.urlimmagine, this.descrizione});

 SantoModel.fromJson(Map<String, dynamic> json) {
  nome = json['nome'];
  tipologia = json['tipologia'];
  data = json['data'];
  defaults = json['default'];
  permalink = json['permalink'];
  urlimmagine = json['urlimmagine'];
  descrizione = json['descrizione'];
 }

 Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['nome'] = nome;
  data['tipologia'] = tipologia;
  data['data'] = this.data;
  data['default'] = defaults;
  data['permalink'] = permalink;
  data['urlimmagine'] = urlimmagine;
  data['descrizione'] = descrizione;
  return data;
 }
}