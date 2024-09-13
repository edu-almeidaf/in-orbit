import { Dialog } from './components/ui/dialog'
import { CreateGoal } from './components/create-goal'
import { Summary } from './components/summary'
import { QueryClientProvider, useQuery } from '@tanstack/react-query'
import { queryClient } from './lib/react-query'
// import { EmptyGoals } from './components/empty-goals'

export function App() {
  const { data } = useQuery({
    queryKey: ['summary'],
    queryFn: async () => {
      const response = await fetch('http://localhost:3333/summary')
      const data = response.json()

      return data
    },
  })

  return (
    <QueryClientProvider client={queryClient}>
      <Dialog>
        {/* <EmptyGoals /> */}
        <Summary />
        <CreateGoal />
      </Dialog>
    </QueryClientProvider>
  )
}
