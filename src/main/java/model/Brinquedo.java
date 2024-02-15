package model;

public class Brinquedo {
	
	private int cod_produto;
	private String descricao;
	private String categoria;
	private String marca;
	private Double preco;
	private String detalhes;
	public String imagem;
	private String nome;
	
	
	
	public Brinquedo(int cod_produto, String descricao, String categoria, String marca, Double preco, String detalhes,
			String imagem, String nome) {
		super();
		this.cod_produto = cod_produto;
		this.descricao = descricao;
		this.categoria = categoria;
		this.marca = marca;
		this.preco = preco;
		this.detalhes = detalhes;
		this.imagem = imagem;
		this.nome = nome;
	}
	public Brinquedo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Brinquedo(String categoria) {
	    this.categoria = categoria;
	}
	public int getCod_produto() {
		return cod_produto;
	}
	public void setCod_produto(int cod_produto) {
		this.cod_produto = cod_produto;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getCategoria() {
		return categoria;
	}
	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
	public String getMarca() {
		return marca;
	}
	public void setMarca(String marca) {
		this.marca = marca;
	}
	public Double getPreco() {
	    return preco;
	}

	public void setPreco(Double preco) {
		this.preco = preco;
	}
	public String getDetalhes() {
		return detalhes;
	}
	public void setDetalhes(String detalhes) {
		this.detalhes = detalhes;
	}
	public String getImagem() {
		return imagem;
	}
	public void setImagem(String imagem) {
		this.imagem = imagem;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	
	
}