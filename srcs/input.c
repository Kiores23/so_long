/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   input.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: amery <amery@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/01/18 15:01:00 by amery             #+#    #+#             */
/*   Updated: 2023/01/25 17:17:32 by amery            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "so_long.h"
#include "mlx.h"

void	player_movement(int keycode, t_game *g)
{
	if (keycode == K_W && g->map[g->xp - 1][g->yp] != '1' &&
		(g->map[g->xp - 1][g->yp] != 'E' || !tabchr(g->map, 'C')))
	{
		g->map[g->xp - 1][g->yp] = 'P';
		g->pos.img = g->pos1.img;
	}
	else if (keycode == K_S && g->map[g->xp + 1][g->yp] != '1' &&
			(g->map[g->xp + 1][g->yp] != 'E' || !tabchr(g->map, 'C')))
	{
		g->map[g->xp + 1][g->yp] = 'P';
		g->pos.img = g->pos2.img;
	}
	else if (keycode == K_A && g->map[g->xp][g->yp - 1] != '1' &&
			(g->map[g->xp][g->yp - 1] != 'E' || !tabchr(g->map, 'C')))
	{
		g->map[g->xp][g->yp - 1] = 'P';
		g->pos.img = g->pos3.img;
	}
	else if (keycode == K_D && g->map[g->xp][g->yp + 1] != '1' &&
			(g->map[g->xp][g->yp + 1] != 'E' || !tabchr(g->map, 'C')))
	{
		g->map[g->xp][g->yp + 1] = 'P';
		g->pos.img = g->pos4.img;
	}
	g->map[g->xp][g->yp] = '0';
}

int	close_mlx(t_game *g)
{
	free_map(g->map, NULL);
	exit(mlx_destroy_window(g->mlx, g->mlx_win));
}

int	key_mlx(int keycode, t_game *g)
{
	int	i;

	i = 0;
	if (keycode == K_ESC)
		close_mlx(g);
	player_coordinates(g);
	if (keycode == K_W || keycode == K_S || keycode == K_A || keycode == K_D)
		player_movement(keycode, g);
	if (player_coordinates(g))
	{
		ft_printf("%i\n", ++(g->count));
		put_map(*g, g->map);
	}
	if (!tabchr(g->map, 'E'))
		close_mlx(g);
	return (0);
}
