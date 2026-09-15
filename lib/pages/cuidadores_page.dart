import 'package:flutter/material.dart';
import '../styles/amigopet_style.dart';
import 'detalhes_cuidador_page.dart';

class Cuidador {
  final String nome;
  final String foto;
  final String descricao;
  final double avaliacao;
  final int avaliacoes;
  final String distancia;
  final String experiencia;
  final String especialidade;

  const Cuidador({
    required this.nome,
    required this.foto,
    required this.descricao,
    required this.avaliacao,
    required this.avaliacoes,
    required this.distancia,
    required this.experiencia,
    required this.especialidade,
  });
}

const List<Cuidador> cuidadores = [
  Cuidador(
    nome: 'Mariana Silva',
    foto: 'https://i.pravatar.cc/300?img=47',
    descricao:
    'Apaixonada por animais e especializada em passeios e cuidados durante viagens.',
    avaliacao: 4.9,
    avaliacoes: 128,
    distancia: '0,8 km',
    experiencia: '5 anos',
    especialidade: 'Cães e gatos',
  ),
  Cuidador(
    nome: 'Lucas Almeida',
    foto: 'https://i.pravatar.cc/300?img=12',
    descricao:
    'Cuidador experiente, paciente e apaixonado por cães de todos os tamanhos.',
    avaliacao: 4.8,
    avaliacoes: 96,
    distancia: '1,2 km',
    experiencia: '4 anos',
    especialidade: 'Cães',
  ),
  Cuidador(
    nome: 'Camila Santos',
    foto: 'https://i.pravatar.cc/300?img=32',
    descricao:
    'Ofereço hospedagem domiciliar com muito carinho, segurança e atenção.',
    avaliacao: 5.0,
    avaliacoes: 74,
    distancia: '1,7 km',
    experiencia: '6 anos',
    especialidade: 'Cães e gatos',
  ),
  Cuidador(
    nome: 'Rafael Costa',
    foto: 'https://i.pravatar.cc/300?img=68',
    descricao:
    'Passeador dedicado que adora atividades ao ar livre e brincadeiras.',
    avaliacao: 4.7,
    avaliacoes: 63,
    distancia: '2,1 km',
    experiencia: '3 anos',
    especialidade: 'Cães',
  ),
  Cuidador(
    nome: 'Juliana Oliveira',
    foto: 'https://i.pravatar.cc/300?img=44',
    descricao:
    'Cuidadora especializada em gatos e pets que precisam de atenção especial.',
    avaliacao: 4.9,
    avaliacoes: 112,
    distancia: '2,5 km',
    experiencia: '7 anos',
    especialidade: 'Gatos',
  ),
];

class CuidadoresPage extends StatefulWidget {
  const CuidadoresPage({super.key});

  @override
  State<CuidadoresPage> createState() => _CuidadoresPageState();
}

class _CuidadoresPageState extends State<CuidadoresPage> {
  String filtro = 'Mais próximos';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AmigoPetDrawer(),

      appBar: AppBar(
        backgroundColor: AmigoPetColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,

        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu_rounded),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),

        title: const Row(
          children: [
            Icon(Icons.pets_rounded),
            SizedBox(width: 10),
            Text(
              'AmigoPet',
              style: AmigoPetStyles.appBarTitle,
            ),
          ],
        ),

        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.tune_rounded),
            tooltip: 'Ordenar e filtrar',

            onSelected: (value) {
              setState(() {
                filtro = value;
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Ordenado por: $value'),
                ),
              );
            },

            itemBuilder: (context) => const [
              PopupMenuItem(
                value: 'Mais próximos',
                child: Row(
                  children: [
                    Icon(Icons.location_on_outlined),
                    SizedBox(width: 10),
                    Text('Mais próximos'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'Melhor avaliados',
                child: Row(
                  children: [
                    Icon(Icons.star_outline),
                    SizedBox(width: 10),
                    Text('Melhor avaliados'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'Menor preço',
                child: Row(
                  children: [
                    Icon(Icons.attach_money),
                    SizedBox(width: 10),
                    Text('Menor preço'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(
              20,
              22,
              20,
              20,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(25),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Encontre um cuidador',
                  style: AmigoPetStyles.title,
                ),

                const SizedBox(height: 7),

                const Text(
                  'Pessoas de confiança para cuidar do seu melhor amigo.',
                  style: AmigoPetStyles.subtitle,
                ),

                const SizedBox(height: 16),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 11,
                  ),
                  decoration: BoxDecoration(
                    color: AmigoPetColors.lightGreen,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.filter_alt_outlined,
                        color: AmigoPetColors.primary,
                        size: 20,
                      ),
                      const SizedBox(width: 9),
                      Text(
                        filtro,
                        style: const TextStyle(
                          color: AmigoPetColors.darkGreen,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(
                16,
                8,
                16,
                25,
              ),
              itemCount: cuidadores.length,

              itemBuilder: (context, index) {
                final cuidador = cuidadores[index];

                return CuidadorCard(
                  cuidador: cuidador,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetalhesCuidadorPage(
                            cuidador: cuidador,
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CuidadorCard extends StatelessWidget {
  final Cuidador cuidador;
  final VoidCallback onTap;

  const CuidadorCard({
    super.key,
    required this.cuidador,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 13),
      color: Colors.white,
      elevation: 1,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,

        child: Padding(
          padding: const EdgeInsets.all(13),

          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(17),
                child: Image.network(
                  cuidador.foto,
                  width: 82,
                  height: 82,
                  fit: BoxFit.cover,

                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 82,
                      height: 82,
                      color: AmigoPetColors.lightGreen,
                      child: const Icon(
                        Icons.person,
                        size: 40,
                        color: AmigoPetColors.primary,
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cuidador.nome,
                      style: AmigoPetStyles.cardTitle,
                    ),

                    const SizedBox(height: 5),

                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: AmigoPetColors.orange,
                          size: 17,
                        ),
                        const SizedBox(width: 3),

                        Text(
                          '${cuidador.avaliacao}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(width: 5),

                        Text(
                          '(${cuidador.avaliacoes})',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AmigoPetColors.textGrey,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 15,
                          color: AmigoPetColors.textGrey,
                        ),

                        const SizedBox(width: 3),

                        Text(
                          cuidador.distancia,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AmigoPetColors.textGrey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const Icon(
                Icons.chevron_right_rounded,
                color: AmigoPetColors.textGrey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AmigoPetDrawer extends StatelessWidget {
  const AmigoPetDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(
              25,
              65,
              25,
              25,
            ),
            decoration: const BoxDecoration(
              color: AmigoPetColors.primary,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
              ),
            ),

            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.pets_rounded,
                    size: 35,
                    color: AmigoPetColors.primary,
                  ),
                ),

                SizedBox(height: 15),

                Text(
                  'AmigoPet',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 4),

                Text(
                  'Cuide. Conecte. Confie.',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          ListTile(
            leading: const Icon(
              Icons.people_alt_outlined,
              color: AmigoPetColors.primary,
            ),
            title: const Text('Cuidadores'),
            selected: true,
            selectedTileColor: AmigoPetColors.lightGreen,
            onTap: () {
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: const Icon(
              Icons.calendar_month_outlined,
            ),
            title: const Text('Meus agendamentos'),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: const Icon(
              Icons.settings_outlined,
            ),
            title: const Text('Configurações'),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          const Spacer(),

          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'AmigoPet • 2026',
              style: TextStyle(
                color: AmigoPetColors.textGrey,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
